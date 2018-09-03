//
//  MDFBaseRequest.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequest.h"
#import <AFNetworking.h>

@implementation MDFBaseRequest

#define MDFWeakSelf __weak __typeof(&*self)weakSelf = self;

- (void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure {
    MDFWeakSelf;
    [self setCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        MDFBaseRequestItem *item = [weakSelf.parseCls new];
        item.code = [request.responseObject[@"code"] integerValue];
        item.message = [NSString stringWithFormat:@"%@",request.responseObject[@"message"]];
        item.timestamp = [NSString stringWithFormat:@"%@",request.responseObject[@"timestamp"]];
        [item mj_setKeyValues:request.responseObject[@"resultObj"]];
        NSLog(@"%@",item);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    [self start];
}

void HookBlockToPrintHelloWorld(id block) {
    struct {
        void* p1;
        void* p2;
        void* p3;
    } *s = (__bridge void*)(block);
    s->p3 = &HookBlockToPrintHelloWorldRedirected;
}

id HookBlockToPrintHelloWorldRedirected(id self)  {
    NSLog(@"%s/%@ Hello world", __func__, self);
    return nil;
}

- (void)hookTest1 {
    
    void (^bglobal)(void) = ^{ NSLog(@"global block: hello world!"); };
    void (^bmalloc)(void) = ^{ NSLog(@"malloc block: hello world! -> %@", self); };
    
    HookBlockToPrintHelloWorld(bglobal);
    HookBlockToPrintHelloWorld(bmalloc);
    
    bglobal();
    bmalloc();
}

void HookBlockToPrintArguments(id block) {
    struct {
        void* p1;
        void* p2;
        void* p3;
        void* p4;
    } *s = (__bridge void*)(block);
    s->p3 = &HookBlockToPrintArgumentsRedirected;
}
id HookBlockToPrintArgumentsRedirected(id self, int a, id b)  {
    NSLog(@"%s/%@ Hello world, arguments: %d, %@", __func__, self, a, b);
    return nil;
}

- (void)hookTest2 {
    
    void (^bglobal)(int a, id b) = ^(int a, id b){
        NSLog(@"global block: hello world!");
    };
    void (^bmalloc)(int a, id b) = ^(int a, id b){
        NSLog(@"malloc block: hello world! -> %@", self);
    };
    
    HookBlockToPrintArguments(bglobal);
    HookBlockToPrintArguments(bmalloc);
    
    bglobal(1, @"This Arguments");
    bmalloc(1, @"This Arguments");
}
@end
