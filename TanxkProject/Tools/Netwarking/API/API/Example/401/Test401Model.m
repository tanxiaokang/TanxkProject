//
//  Test401Model.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/536.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "Test401Model.h"

@implementation Test401Model
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
    return @"/api-happyloan/rnjf-happyloan/api/v1/appuer/checkUserCretStatus";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{@"userNo": _userNo};
}

@end
