//
//  Network+ProductType.m
//  weeklywhitebars
//
//  Created by tanxiaokang on 2018/8/1633.
//  Copyright © 2018年  lixinxin. All rights reserved.
//

#import "Network+ProductType.h"

@implementation Network (ProductType)

+ (NSMutableDictionary *)addProduct:(NSDictionary *)params {
    if (params == nil) {
        return nil;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    dic[@"productType"] = @"";
    dic[@"ProductType"] = @"";
    return dic;
}

@end
