//
//  RegisterAPI.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/327.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "RegisterAPI.h"


@implementation RegisterAPI {
    NSString *_username;
    NSString *_password;
}

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    return @{@"token":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVUaW1lIjoiMjAxOC0wOS0wOSAxNjoxMzoyMyIsInVzZXJObyI6IjEwMDQyMDE4MDYyMDE2NTQwMjg2MzEwMDAxIn0.hIETbXSEg8rgDk0LF-z9tjC8gMB3lgztnLiRZdWXJWk"};
}

- (NSString *)baseUrl
{//
//    return @"https://api.runnongjinfu.com/api-happyloan/rnjf-happyloan/api/v1";
    return @"https://api.runnongjinfu.com";
}

- (NSString *)requestUrl {
    // “ http://www.yuantiku.com ” 在 YTKNetworkConfig 中设置，这里只填除去域名剩余的网址信息
//    return @"/api-happyloan/rnjf-happyloan/api/v1/appuser/checkUserCretStatus";
    return @"/api-auth/rnjf/authentication/utils/queryBankName";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"BankCard": @"6214830123854209"
             };
}

@end
