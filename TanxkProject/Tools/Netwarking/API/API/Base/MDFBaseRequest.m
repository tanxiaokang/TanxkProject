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

- (void)startWithCompletionBlockWithSuccess:(MDFRequestCompletionBlock)success
                                    failure:(MDFRequestCompletionBlock)failure {
    MDFWeakSelf;
    [self setCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        MDFBaseRequestItem *item = [weakSelf configItem:request.responseObject];
        if (success) {
            success(item);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        MDFBaseRequestItem *item = [weakSelf configItem:request.responseObject];
        
        if (failure) {
            failure(item);
        }
    }];
    [self start];
}

- (MDFBaseRequestItem *)configItem:(id)responseObject {
    
    MDFBaseRequestItem *item = [self.parseCls new];
    item.code = [responseObject[@"code"] integerValue];
    item.message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];
    item.timestamp = [NSString stringWithFormat:@"%@",responseObject[@"timestamp"]];
    [item mj_setKeyValues:responseObject[@"resultObj"]];
    return item;
}

#pragma mark - Other
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
