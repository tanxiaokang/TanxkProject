//
//  MDFBaseRequestItem.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3135.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDFBaseRequestItem : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *timestamp;

@end
