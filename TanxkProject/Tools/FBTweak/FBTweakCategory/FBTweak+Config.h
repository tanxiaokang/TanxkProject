//
//  FBTweak+Config.h
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/527.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "FBTweak.h"

@interface FBTweak (Config)

#pragma mark - 基础配置
///开启控制台打印日志（网络请求）
+ (BOOL)bn_clientAnalyticsUtil;
#pragma mark - 环境切换
/// 是否启用https
+ (BOOL)mdf_clientHttps;

#pragma mark - 查看信息
/// 查看最近请求
+ (void)bn_lateRequest;

@end
