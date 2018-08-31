//
//  YTKNetworkAgent+securityPolicy.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKNetworkAgent+securityPolicy.h"
#import "AFNetworking.h"

@implementation YTKNetworkAgent (securityPolicy)

/**
 根据URL判断用哪个证书

 @param url 请求地址
 @return 证书
 */
- (AFSecurityPolicy*)configSecurityPolicy:(NSString *)url
{
    
    if (obtionFileName(url).length == 0) {
        return nil;
    }
    
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:obtionFileName(url) ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    securityPolicy.allowInvalidCertificates = YES;// 如果是需要验证自建证书，需要设置为YES // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    securityPolicy.validatesDomainName = NO;//如置为NO，建议自己添加对应域名的校验逻辑。
    
    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}

NSString *obtionFileName(NSString *url){
    if ([url hasPrefix:HPLBaseURL_Release]) {
        return @"api_runnongjinfu_com";
    } else if([url hasPrefix:HPLAuthenticationAddressKey]){
        return @"runnongjinfu";
    }
    return @"";
}
@end
