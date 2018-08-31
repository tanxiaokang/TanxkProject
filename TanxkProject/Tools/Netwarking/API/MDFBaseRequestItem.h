//
//  MDFBaseRequestItem.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKRequest.h"

@interface MDFBaseRequestItem : YTKRequest

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *timestamp;

- (void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure;

+ (AFSecurityPolicy*)configSecurityPolicy:(NSString *)policy;

@end
