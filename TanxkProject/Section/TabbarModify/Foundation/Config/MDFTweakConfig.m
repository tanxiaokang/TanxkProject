//
//  MDFTweakConfig.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFTweakConfig.h"
#import "MDFTweakStoreData.h"

#import <libkern/OSAtomic.h> //包含是大量关于原子操作和同步操作的函数，如果要对数据进行同步操作，这里面的函数可以作为我们的首选项。不同平台这些函数的实现是自定义的。另外，它们是线程安全的。
#import <dlfcn.h>
#import <mach-o/getsect.h>

extern NSString *_MDFTweakIdentifier(mdf_tweak_entry *entry)
{
    return [NSString stringWithFormat:@"FBTweak:%@-%@-%@", *entry->category, *entry->collection, *entry->name];
}

static MDFTweakStoreData *_MDFTweakCreateWithEntry(mdf_tweak_entry *entry)
{
    MDFTweakStoreData *tweak = [[MDFTweakStoreData alloc] init];
    tweak.name = *entry->name;
    tweak.category = *entry->category;
    tweak.collection = *entry->collection;
    return tweak;
}

@implementation MDFTweakConfig

+ (void)load
{
    static uint32_t _tweaksLoaded = 0;
    if (OSAtomicTestAndSetBarrier(1, &_tweaksLoaded)) {
        return;
    }

#ifdef __LP64__
    typedef uint64_t mdf_tweak_value;
    typedef struct section_64 mdf_tweak_section;
#define mdf_tweak_getsectbynamefromheader getsectbynamefromheader_64
#else
    typedef uint32_t mdf_tweak_value;
    typedef struct section mdf_tweak_section;
#define mdf_tweak_getsectbynamefromheader getsectbynamefromheader
#endif
    
    Dl_info info;

    dladdr(&_MDFTweakIdentifier, &info);
    
    const mdf_tweak_value mach_header = (mdf_tweak_value)info.dli_fbase;
    const mdf_tweak_section *section = mdf_tweak_getsectbynamefromheader((void *)mach_header, MDFTweakSegmentName, MDFTweakSectionName);
    
    if (section == NULL) {
        return;
    }
    
    for (mdf_tweak_value addr = section->offset; addr < section->offset + section->size; addr += sizeof(mdf_tweak_entry))
    {
        mdf_tweak_entry *entry = (mdf_tweak_entry *)(mach_header + addr);
        MDFTweakStoreData *store = _MDFTweakCreateWithEntry(entry);
        [[MDFTweakStoreData sharedInstance] setTweakStore:store];
    }
}
@end
