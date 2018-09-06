//
//  LoginItem.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/636.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequestItem.h"

@interface LoginItem : MDFBaseRequestItem

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *userNo;

@end
