//
//  TXKDesignPatternsWithNetworkAtInvoke.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/1228.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKDesignPatternsWithNetworkAtInvoke.h"

#import "TXKNetworkAtInvokeWithNoeHaveLoadAnimation.h"
#import "TXKNetworkAtInvokeWithHaveLoadAnimation.h"

@implementation TXKDesignPatternsWithNetworkAtInvoke
- (instancetype)init
{
    self = [super init];
    if (self) {
        [TXKNetworkAtInvokeWithHaveLoadAnimation hanleDataToHome:@{} success:^(__kindof NSObject * _Nonnull item) {
            
        } failure:^(__kindof NSObject * _Nonnull item) {
            
        }];
    }
    return self;
}
@end
