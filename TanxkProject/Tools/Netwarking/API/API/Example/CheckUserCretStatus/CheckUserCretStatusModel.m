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
        self.parseCls = [CheckUserCretStatusItem class];
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[@"token"] = [[NSUserDefaults standardUserDefaults] valueForKey:TKPToken];
    return dict;
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
    NSMutableDictionary *paramas = [[NSMutableDictionary alloc] initWithCapacity:10];
    [paramas setValue:_userNo forKey:@"userNo"];
//    paramas[@"userNo"] = _userNo;
    return paramas;
}

@end
