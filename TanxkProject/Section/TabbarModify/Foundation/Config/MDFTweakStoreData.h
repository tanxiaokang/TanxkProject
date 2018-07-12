//
//  MDFTweakStoreData.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1228.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDFTweakConfig.h"

@interface MDFTweakStoreData : NSObject

@property (nonatomic, copy, readwrite) NSString *category;;
@property (nonatomic, copy, readwrite) NSString *collection;
@property (nonatomic, copy, readwrite) NSString *name;

+ (instancetype)sharedInstance;

- (NSMutableArray *)getTweakStore;
- (void)setTweakStore:(MDFTweakStoreData *)entry;

@end
