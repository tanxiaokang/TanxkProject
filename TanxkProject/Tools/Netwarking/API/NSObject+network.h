//
//  NSObject+network.h
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/427.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDFNetwork.h"

@interface NSObject (network)

- (void)link:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success;
- (void)link:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure;

- (void)linkWithNoAnimation:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success;
- (void)linkWithNoAnimation:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure;

@end
