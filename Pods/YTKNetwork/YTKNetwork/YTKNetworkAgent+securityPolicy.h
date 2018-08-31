//
//  YTKNetworkAgent+securityPolicy.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKNetworkAgent.h"

@class AFSecurityPolicy;

static NSString *const HPLAuthenticationAddressKey = @"https://api.runnongjinfu.com/api-auth/rnjf/authentication";/**<认证中心,通过次字段确定是否是认证中心接口*/
static NSString *const HPLBaseURL_Release =          @"https://api.runnongjinfu.com/api-happyloan/rnjf-happyloan/api/v1/";

@interface YTKNetworkAgent (securityPolicy)

/**
 根据URL判断用哪个证书
 
 @param url 请求地址
 @return 证书
 */
- (AFSecurityPolicy*)configSecurityPolicy:(NSString *)url;

@end
