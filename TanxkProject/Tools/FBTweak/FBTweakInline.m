/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBTweakInline.h"
#import "FBTweak.h"
#import "FBTweakInlineInternal.h"
#import "FBTweakCollection.h"
#import "FBTweakStore.h"
#import "FBTweakCategory.h"

#import <libkern/OSAtomic.h>
#import <mach-o/getsect.h>
#import <mach-o/dyld.h>
#import <dlfcn.h>

#if FB_TWEAK_ENABLED

extern NSString *_FBTweakIdentifier(fb_tweak_entry *entry)
{
  return [NSString stringWithFormat:@"FBTweak:%@-%@-%@", *entry->category, *entry->collection, *entry->name];
}

static FBTweak *_FBTweakCreateWithEntry(NSString *identifier, fb_tweak_entry *entry)
{
  FBTweak *tweak = [[FBTweak alloc] initWithIdentifier:identifier];
  tweak.name = *entry->name;

  if (strcmp(*entry->encoding, FBTweakEncodingAction) == 0) {
    tweak.defaultValue = *(dispatch_block_t __strong *)entry->value;
  } else if (strcmp(*entry->encoding, @encode(BOOL)) == 0) {
    tweak.defaultValue = @(*(BOOL *)entry->value);
  } else if (strcmp(*entry->encoding, @encode(float)) == 0) {
    tweak.defaultValue = [NSNumber numberWithFloat:*(float *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithFloat:*(float *)entry->min];
      tweak.maximumValue = [NSNumber numberWithFloat:*(float *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(double)) == 0) {
    tweak.defaultValue = [NSNumber numberWithDouble:*(double *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithDouble:*(double *)entry->min];
      tweak.maximumValue = [NSNumber numberWithDouble:*(double *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(short)) == 0) {
    tweak.defaultValue = [NSNumber numberWithShort:*(short *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithShort:*(short *)entry->min];
      tweak.maximumValue = [NSNumber numberWithShort:*(short *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(unsigned short)) == 0) {
    tweak.defaultValue = [NSNumber numberWithUnsignedShort:*(unsigned short int *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithUnsignedShort:*(unsigned short *)entry->min];
      tweak.maximumValue = [NSNumber numberWithUnsignedShort:*(unsigned short *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(int)) == 0) {
    tweak.defaultValue = [NSNumber numberWithInt:*(int *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithInt:*(int *)entry->min];
      tweak.maximumValue = [NSNumber numberWithInt:*(int *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(unsigned int)) == 0) {
    tweak.defaultValue = [NSNumber numberWithUnsignedInt:*(unsigned int *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithUnsignedInt:*(unsigned int *)entry->min];
      tweak.maximumValue = [NSNumber numberWithUnsignedInt:*(unsigned int *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(long long)) == 0) {
    tweak.defaultValue = [NSNumber numberWithLongLong:*(long long *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithLongLong:*(long long *)entry->min];
      tweak.maximumValue = [NSNumber numberWithLongLong:*(long long *)entry->max];
    }
  } else if (strcmp(*entry->encoding, @encode(unsigned long long)) == 0) {
    tweak.defaultValue = [NSNumber numberWithUnsignedLongLong:*(unsigned long long *)entry->value];
    if (entry->min != NULL && entry->max != NULL) {
      tweak.minimumValue = [NSNumber numberWithUnsignedLongLong:*(unsigned long long *)entry->min];
      tweak.maximumValue = [NSNumber numberWithUnsignedLongLong:*(unsigned long long *)entry->max];
    }
  } else if (*entry->encoding[0] == '[') {
    // Assume it's a C string.
    tweak.defaultValue = [NSString stringWithUTF8String:entry->value];
  } else if (strcmp(*entry->encoding, @encode(id)) == 0) {
    tweak.defaultValue = *((__unsafe_unretained id *)entry->value);
  } else {
    NSCAssert(NO, @"Unknown encoding %s for tweak %@. Value was %p.", *entry->encoding, _FBTweakIdentifier(entry), entry->value);
    tweak = nil;
  }
  
  return tweak;
}

@interface _FBTweakInlineLoader : NSObject
@end

@implementation _FBTweakInlineLoader

+ (void)load
{
/* https://blog.csdn.net/pjk1129/article/details/44779831
 OSAtomicTestAndClear/OSAtomicTestAndClearBarrier( uint32_t __n, volatile void *__theAddress )：这组函数用于测试__theAddress指向的值中由__n指定的bit位，如果该位未被清除，则清除它。需要注意的是最低bit位应该是1，而不是0。对于一个64-bit的值来说，如果要清除最高位的值，则__n应该是64。
 OSAtomicTestAndSet/OSAtomicTestAndSetBarrier(uint32_t __n, volatile void *__theAddress)：与OSAtomicTestAndClear相反，这组函数测试值后，如果指定位没有设置，则设置它。
 */
  static uint32_t _tweaksLoaded = 0;
  if (OSAtomicTestAndSetBarrier(1, &_tweaksLoaded)) {
    return;
  }
  //如果设备是64位
#ifdef __LP64__
  typedef uint64_t fb_tweak_value;
  typedef struct section_64 fb_tweak_section;
#define fb_tweak_getsectbynamefromheader getsectbynamefromheader_64
#else
  typedef uint32_t fb_tweak_value;
  typedef struct section fb_tweak_section;
#define fb_tweak_getsectbynamefromheader getsectbynamefromheader
#endif
  
  FBTweakStore *store = [FBTweakStore sharedInstance];
  
    /* https://blog.csdn.net/dragon101788/article/details/18673323
     Dl_info 结构包含以下字段：
        dli_fname 一个指针，指向包含address的加载模块的文件名。每次调用dladdr() 后，该内存位置的内容都可能发生更改。
        dli_fbase 加载模块的句柄。该句柄可用作dlsym() 的第一个参数。
        dli_sname 一个指针，指向与指定的address最接近的符号的名称。该符号要么带有相同的地址，要么是带有低位地址的最接近符号。两次调用dladdr() 后，该内存位置的内容可能发生更改。Section 3-264 Hewlett-Packard Company − 1 − HP-UX 11i Version 3: February 2007 dladdr(3C) dladdr(3C)
        dli_saddr 最接近符号的实际地址。对于代码符号，它包含最接近代码符号的OPD（正式Plabel 描述符）的地址。
     */
  Dl_info info;
    //获取某个地址的符号信息
  dladdr(&_FBTweakIdentifier, &info);
  
  const fb_tweak_value mach_header = (fb_tweak_value)info.dli_fbase;
  const fb_tweak_section *section = fb_tweak_getsectbynamefromheader((void *)mach_header, FBTweakSegmentName, FBTweakSectionName);
  
  if (section == NULL) {
    return;
  }
  
  for (fb_tweak_value addr = section->offset;
       addr < section->offset + section->size;
       addr += sizeof(fb_tweak_entry))
  {
    fb_tweak_entry *entry = (fb_tweak_entry *)(mach_header + addr);
    
    FBTweakCategory *category = [store tweakCategoryWithName:*entry->category];
    if (category == nil) {
      category = [[FBTweakCategory alloc] initWithName:*entry->category];
      [store addTweakCategory:category];
    }
    
    FBTweakCollection *collection = [category tweakCollectionWithName:*entry->collection];
    if (collection == nil) {
      collection = [[FBTweakCollection alloc] initWithName:*entry->collection];
      [category addTweakCollection:collection];
    }
    
    NSString *identifier = _FBTweakIdentifier(entry);
    if ([collection tweakWithIdentifier:identifier] == nil) {
      FBTweak *tweak = _FBTweakCreateWithEntry(identifier, entry);

      if (tweak != nil) {
        [collection addTweak:tweak];
      }
    }
  }
}

@end

#endif
