//
//  MDFTweakConfig.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>


#define MDFTweakSegmentName "__DATA"
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

@interface MDFTweakConfig : NSObject

@end
