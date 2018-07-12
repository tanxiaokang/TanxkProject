//
//  MDFTweakConfig.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>


#define MDFTweakSegmentName "mdf__DATA"
#define MDFTweakSectionName "MDFTweak"
#define MDFTweakEncodingAction "__ACTION__"

typedef __unsafe_unretained NSString *MDFTweakLiteralString;
typedef struct {
    MDFTweakLiteralString *category;
    MDFTweakLiteralString *collection;
    MDFTweakLiteralString *name;
    void *value;
    void *min;
    void *max;
    char **encoding;
} mdf_tweak_entry;

extern NSString *_MDFTweakIdentifier(mdf_tweak_entry *entry);

#define MDFTweakValue(category_, collection_, name_, ...) \
__attribute__((used)) static MDFTweakLiteralString category__ = category_; \
__attribute__((used)) static MDFTweakLiteralString collection__ = collection_; \
__attribute__((used)) static MDFTweakLiteralString name__ = name_; \
__attribute__((used)) static __typeof__(__objc_yes) default__ = __objc_yes; \
__attribute__((used)) static char *encoding__ = (char *)@encode(__typeof__(__objc_yes));\
__attribute__((used)) __attribute__((section (MDFTweakSegmentName "," MDFTweakSectionName))) static mdf_tweak_entry entry = {&category__,&collection__,&name__,(void *)&default__,(void *)((void*)0),(void *)((void*)0),&encoding__};

@interface MDFTweakConfig : NSObject

@end
