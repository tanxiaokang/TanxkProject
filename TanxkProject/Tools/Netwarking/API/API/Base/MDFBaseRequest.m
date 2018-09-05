//
//  MDFBaseRequest.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseRequest.h"
#import <AFNetworking.h>

#import "YTKNetworkConfig+addFeature.h"

@implementation MDFBaseRequest

#define MDFWeakSelf __weak __typeof(&*self)weakSelf = self;

#pragma mark - LifeCycle
- (void)startWithCompletionBlockWithSuccess:(MDFRequestCompletionBlock)success
                                    failure:(MDFRequestCompletionBlock)failure {
    
    if (self.isAutoShowLoading == YES) {
        [SVProgressHUD showWithStatus:@"加载中"];
    }
    MDFWeakSelf;
    [self setCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
       
        MDFBaseRequestItem *item = [weakSelf configItem:request.responseObject];
        
        if (self.isAutoShowLoading == YES) {
            [SVProgressHUD dismiss];
        }
        if (item.code == 401) {
            
            [YTKNetworkConfig sharedConfig].signOutBlock(401);
            //退出登录
            return ;
        }
        if (success) {
            success(item);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        MDFBaseRequestItem *item = [weakSelf configItem:request.responseObject];
        
        if (self.isAutoShowLoading == YES) {
            [SVProgressHUD dismiss];
        }
        
        if (request.responseObject == nil) {
            if (weakSelf.isAutoShowNetworkErrorToast) {
                if (request.responseStatusCode != 1) {
                    [SVProgressHUD showErrorWithStatus:@"请求失败，请稍后重试"];
                }
            }
        }
        if (failure) {
            failure(item);
        }
    }];
    [self start];
}

#pragma mark - Work
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
