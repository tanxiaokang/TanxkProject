//
//  CheckUserCretStatusItem.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/636.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequestItem.h"

@interface CheckUserCretStatusItem : MDFBaseRequestItem

@property (nonatomic, assign) NSInteger bankFlowStatus;
@property (nonatomic, assign) NSInteger bankStatus;
@property (nonatomic, assign) NSInteger carrieroperator;
@property (nonatomic, strong) NSDictionary *personAuthStatus;

@end
