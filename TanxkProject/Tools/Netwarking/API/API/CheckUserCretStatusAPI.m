//
//  CheckUserCretStatusAPI.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3135.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "CheckUserCretStatusAPI.h"

@implementation CheckUserCretStatusAPI
{
    NSString *_userNo;
}

- (id)initWithUserNo:(NSString *)userNo{
    self = [super init];
    if (self) {
        _userNo = userNo;
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    return @{@"token":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVUaW1lIjoiMjAxOC0wOS0wOSAxNjoxMzoyMyIsInVzZXJObyI6IjEwMDQyMDE4MDYyMDE2NTQwMjg2MzEwMDAxIn0.hIETbXSEg8rgDk0LF-z9tjC8gMB3lgztnLiRZdWXJWk"};
}

- (NSString *)baseUrl
{
    return @"https://api.runnongjinfu.com";
}

- (NSString *)requestUrl {
    // “ http://www.yuantiku.com ” 在 YTKNetworkConfig 中设置，这里只填除去域名剩余的网址信息
    return @"/api-happyloan/rnjf-happyloan/api/v1/appuser/checkUserCretStatus";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{@"userNo": _userNo};
}

@end
