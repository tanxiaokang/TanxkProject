//
//  MDFTabBarControllerConfig.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1128.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFTabBarControllerConfig.h"

extern NSString *_MDFTabBarControllerIdentifier(mdf_tabbarController_entry *entry)
{
    return [NSString stringWithFormat:@"FBTweak:%@-%@-%@", *entry->category, *entry->collection, *entry->name];
}
