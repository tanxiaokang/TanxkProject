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
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *timestamp;

@end
