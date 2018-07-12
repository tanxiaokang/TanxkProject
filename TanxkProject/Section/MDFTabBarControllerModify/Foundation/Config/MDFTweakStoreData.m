//
//  MDFTweakStoreData.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFTweakStoreData.h"

@implementation MDFTweakStoreData{
    NSMutableArray *_orderedCategories;
}

+ (instancetype)sharedInstance
{
    static MDFTweakStoreData *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if ((self = [super init])) {
        _orderedCategories = [[NSMutableArray alloc] initWithCapacity:16];
    }
    
    return self;
}

- (void)setTweakStore:(MDFTweakStoreData *)entry{
    
    [_orderedCategories addObject:entry];
}

- (NSMutableArray *)getTweakStore {
    return [_orderedCategories copy];
}

@end
