//
//  LoginModel.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/636.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel {
    NSString *_mobile, *_password;
}

- (id)initWithMobile:(NSString *)mobile Password:(NSString *)password {
    
    self = [super init];
    if (self) {
        _mobile = mobile;
        _password = password;
        self.isAutoShowLoading = YES;
        self.isAutoShowBusinessErrorToast = YES;
        self.parseCls = [LoginItem class];
    }
    return self;
}

- (NSString *)baseUrl {
    return @"https://api.runnongjinfu.com";
}
- (NSString *)requestUrl {
    return @"/api-happyloan/rnjf-happyloan/api/v1/appuser/appuserLogin";
}

#pragma mark - loadBody
- (NSURLRequest *)buildCustomUrlRequest {
    
    NSString *jsonStr = [self mdf_jsonValueToDic:self.requestArgument];
    NSData *postData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.baseUrl,self.requestUrl]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    return request;
}

- (NSString *)mdf_jsonValueToDic:(NSDictionary *)dict {
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}

- (id)requestArgument {
    
    NSMutableDictionary *paramas = [NSMutableDictionary new];
    paramas[@"mobile"] = _mobile;
    paramas[@"password"] = _password;
    paramas[@"userName"]  = @"asd";
    paramas[@"phoneSystemModel"] = @"12";
    paramas[@"phoneModel"] = @"asd";
    paramas[@"phoneBrand"] = @"iPhone";
    paramas[@"mac"] = @"0";
    paramas[@"deviceId"] = @"asd";
    paramas[@"source"] = @"0";  //
    paramas[@"channel"] = @"iOS";// 渠道
    paramas[@"longitude"] = @"123";// 经度
    paramas[@"latitude"] = @"asd";// 维度
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    paramas[@"APPVERSION"] = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return paramas;
}
@end
