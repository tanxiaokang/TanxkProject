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

#pragma mark - 验证证书
+ (AFSecurityPolicy*)configSecurityPolicy:(NSString *)policy
{
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:policy ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    securityPolicy.allowInvalidCertificates = YES;// 如果是需要验证自建证书，需要设置为YES // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    securityPolicy.validatesDomainName = NO;//如置为NO，建议自己添加对应域名的校验逻辑。
    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}

@end
