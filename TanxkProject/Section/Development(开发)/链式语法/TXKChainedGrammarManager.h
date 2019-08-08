//
//  TXKChainedGrammarManager.h
//  TanxkProject
//
//  Created by tanxk on 2019/7/2931.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ActionBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN
///链式语法练习
@interface TXKChainedGrammarManager : NSObject

+ (TXKChainedGrammarManager *)manager;

- (TXKChainedGrammarManager *(^)(NSString *msg))addMessage;

- (TXKChainedGrammarManager *(^)(ActionBlock block))addAction;

- (TXKChainedGrammarManager *(^)(NSObject *model))addRequest;
- (TXKChainedGrammarManager *(^)(NSObject *model))addCompletion;

@end

NS_ASSUME_NONNULL_END
