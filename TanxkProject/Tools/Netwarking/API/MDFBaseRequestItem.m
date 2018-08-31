//
//  MDFBaseRequestItem.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequestItem.h"
#import <AFNetworking.h>

@implementation MDFBaseRequestItem

- (void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
//    [self setCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//
//    }];
    [self start];
    
}

@end
