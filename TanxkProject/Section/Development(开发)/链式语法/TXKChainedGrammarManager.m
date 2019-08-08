//
//  TXKChainedGrammarManager.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/2931.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKChainedGrammarManager.h"

@implementation TXKChainedGrammarManager

+ (TXKChainedGrammarManager *)manager {
//    static id sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[self alloc] init];
//    });
    return [[self alloc] init];
}

- (TXKChainedGrammarManager *(^)(NSString *msg))addMessage {
    return ^TXKChainedGrammarManager *(NSString *msg) {
      
        return self;
    };
}

- (TXKChainedGrammarManager *(^)(ActionBlock block))addAction {
    
    return ^TXKChainedGrammarManager *(ActionBlock block) {
        return self;
    };
}

- (TXKChainedGrammarManager *(^)(NSObject *model))addCompletion {
    
    return ^TXKChainedGrammarManager *(NSObject *model)
    {
        return self;
    };
}

- (TXKChainedGrammarManager *(^)(NSObject *model))addRequest {
    
    return ^TXKChainedGrammarManager *(NSObject *model)
    {
        return self;
    };
}
@end
