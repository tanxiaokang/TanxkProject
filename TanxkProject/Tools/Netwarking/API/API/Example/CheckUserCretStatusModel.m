//
//  CheckUserCretStatusModel.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3135.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "CheckUserCretStatusModel.h"

@implementation CheckUserCretStatusModel
{
    NSString *_userNo;
}

- (id)initWithUserNo:(NSString *)userNo{
    self = [super init];
    if (self) {
        _userNo = userNo;
        self.parseCls = [QueryBankNameItem class];
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    return @{@"token":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVUaW1lIjoiMjAxOC0wOS0xMyAxMjoxMDozMSIsInVzZXJObyI6IjEwMDQyMDE4MDYyMDE2NTQwMjg2MzEwMDAxIn0.l8JUBiGVwIx6n9TpZInDITzFblPcX-tz0RUALjsg_1Y"};
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
