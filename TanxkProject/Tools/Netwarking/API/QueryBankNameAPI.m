//
//  QueryBankNameAPI.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3135.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "QueryBankNameAPI.h"

@implementation QueryBankNameAPI{
    NSString *_bankCard;
}

- (id)initWithBankCard:(NSString *)bankCard{
    
    self = [super init];
    if (self) {
        _bankCard = bankCard;
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
    return @"/api-auth/rnjf/authentication/utils/queryBankName";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
              @"BankCard": _bankCard
             };
}
@end
