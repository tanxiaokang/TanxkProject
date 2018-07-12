//
//  MDFTweakConfig.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFTweakConfig.h"

extern NSString *_MDFTweakIdentifier(mdf_tabbarController_entry *entry)
{
    return [NSString stringWithFormat:@"FBTweak:%@-%@-%@", *entry->category, *entry->collection, *entry->name];
}

@implementation MDFTweakConfig

@end
