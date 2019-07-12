//
//  TXKNetworkAtInvoke.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/1228.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKNetworkAtInvoke.h"

@implementation TXKNetworkAtInvoke
+ (BOOL)hanleDataToHome:(NSDictionary *)params  success:(void (^)(__kindof NSObject *item))success failure:(void (^)(__kindof NSObject *item))failure { return YES;}
+ (BOOL)hanleDataToUser:(NSDictionary *)params  success:(void (^)(__kindof NSObject *item))success failure:(void (^)(__kindof NSObject *item))failure { return YES;}
+ (BOOL)hanleDataToOrder:(NSDictionary *)params success:(void (^)(__kindof NSObject *item))success failure:(void (^)(__kindof NSObject *item))failure { return YES;}
@end
