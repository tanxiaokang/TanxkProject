//
//  QueryBankNameAPI.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3135.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequest.h"

@interface QueryBankNameAPI : MDFBaseRequest

- (id)initWithBankCard:(NSString *)bankCard;

@end
