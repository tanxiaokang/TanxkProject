//
//  MDFBaseRequest.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKRequest.h"
#import "MDFBaseRequestItem.h"

typedef void(^MDFRequestCompletionBlock)(__kindof MDFBaseRequestItem *item);

@interface MDFBaseRequest : YTKRequest

@property (nonatomic, strong) Class parseCls;

- (void)startWithCompletionBlockWithSuccess:(MDFRequestCompletionBlock)success
                                    failure:(MDFRequestCompletionBlock)failure;

@end