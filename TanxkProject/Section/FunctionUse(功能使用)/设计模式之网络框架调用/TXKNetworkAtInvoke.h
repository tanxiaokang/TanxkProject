//
//  TXKNetworkAtInvoke.h
//  TanxkProject
//
//  Created by tanxk on 2019/7/1228.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXKNetworkAtInvoke : NSObject

+ (BOOL)hanleDataToHome:(NSDictionary *)params  success:(void (^)(__kindof NSObject *item))success failure:(void (^)(__kindof NSObject *item))failure;
+ (BOOL)hanleDataToUser:(NSDictionary *)params  success:(void (^)(__kindof NSObject *item))success failure:(void (^)(__kindof NSObject *item))failure;
+ (BOOL)hanleDataToOrder:(NSDictionary *)params success:(void (^)(__kindof NSObject *item))success failure:(void (^)(__kindof NSObject *item))failure;

@end

NS_ASSUME_NONNULL_END
