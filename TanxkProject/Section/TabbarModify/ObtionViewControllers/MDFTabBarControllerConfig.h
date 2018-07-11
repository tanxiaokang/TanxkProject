//
//  MDFTabBarControllerConfig.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1128.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef __unsafe_unretained NSString *MDFTabBarControllerLiteralString;

typedef struct {
    MDFTabBarControllerLiteralString *category;
    MDFTabBarControllerLiteralString *collection;
    MDFTabBarControllerLiteralString *name;
    void *value;
    void *min;
    void *max;
    char **encoding;
} mdf_tabbarController_entry;

extern NSString *_MDFTabBarControllerIdentifier(mdf_tabbarController_entry *entry);
