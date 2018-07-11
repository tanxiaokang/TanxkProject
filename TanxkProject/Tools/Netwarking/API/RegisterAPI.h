//
//  RegisterAPI.h
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/327.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKRequest.h"

@interface RegisterAPI : YTKRequest

- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@end
