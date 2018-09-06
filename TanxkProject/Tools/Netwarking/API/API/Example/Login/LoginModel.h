//
//  LoginModel.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/636.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequest.h"
#import "LoginItem.h"

@interface LoginModel : MDFBaseRequest

- (id)initWithMobile:(NSString *)mobile Password:(NSString *)password;

@end
