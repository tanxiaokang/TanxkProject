//
//  MDFNetwork.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/427.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFNetwork.h"

@implementation MDFNetwork

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString *)requestUrl {
    return self.mdf_requestUrl;
}

- (id)requestArgument {
    return self.mdf_params;
}

@end
