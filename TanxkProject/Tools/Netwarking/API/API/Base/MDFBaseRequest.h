//
//  MDFBaseRequest.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKRequest.h"
#import "MDFBaseRequestItem.h"

typedef void(^MDFRequestCompletionBlock)(__kindof MDFBaseRequestItem *item);

@interface MDFBaseRequest : YTKRequest

/// 模型类
@property (nonatomic, strong) Class parseCls;
/// 请求域名类型 暂未启用
@property (nonatomic, assign) NSInteger hostType;
/// 是否展示加载中动画 默认 YES
@property (nonatomic, assign) BOOL isAutoShowLoading;
/// 展示网络错误toast，默认YES
@property (nonatomic, assign) BOOL isAutoShowNetworkErrorToast;
/// 展示业务错误toast，默认NO
@property (nonatomic, assign) BOOL isAutoShowBusinessErrorToast;
/// 用户是否是可以操作的 默认YES
@property (nonatomic, assign) BOOL isEnableUserInteraction;

- (void)startWithCompletionBlockWithSuccess:(MDFRequestCompletionBlock)success
                                    failure:(MDFRequestCompletionBlock)failure;

@end
