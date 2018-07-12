//
//  MDFTweakConfig.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef __unsafe_unretained NSString *MDFTweakLiteralString;
typedef struct {
    MDFTweakLiteralString *category;
    MDFTweakLiteralString *collection;
    MDFTweakLiteralString *name;
    void *value;
    void *min;
    void *max;
    char **encoding;
} mdf_tabbarController_entry;

extern NSString *_MDFTweakIdentifier(mdf_tabbarController_entry *entry);


@interface MDFTweakConfig : NSObject

@end
