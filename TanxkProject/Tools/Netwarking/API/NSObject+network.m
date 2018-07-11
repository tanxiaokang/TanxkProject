//
//  NSObject+network.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/427.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "NSObject+network.h"

@implementation NSObject (network)

#pragma mark - Public
- (void)link:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success {
    
    MDFNetwork *network = [self shareNetworkWithUrl:url parameters:params];
    network.mdf_loadingAnimation = YES;
    network.mdf_tipPopup = YES;
    [self network:network link:url parameters:params Success:success failure:nil];
}

- (void)link:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure {
    
    MDFNetwork *network = [self shareNetworkWithUrl:url parameters:params];
    network.mdf_loadingAnimation = YES;
    network.mdf_tipPopup = YES;
    [self network:network link:url parameters:params Success:success failure:failure];
}

- (void)linkWithNoAnimation:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success {
    
    MDFNetwork *network = [self shareNetworkWithUrl:url parameters:params];
    network.mdf_loadingAnimation = NO;
    network.mdf_tipPopup = NO;
    [self network:network link:url parameters:params Success:success failure:nil];
}

- (void)linkWithNoAnimation:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure {
    
    MDFNetwork *network = [self shareNetworkWithUrl:url parameters:params];
    network.mdf_loadingAnimation = NO;
    network.mdf_tipPopup = NO;
    [self network:network link:url parameters:params Success:success failure:failure];
}

#pragma mark - Private
- (void)network:(MDFNetwork *)network link:(NSString *)url parameters:(NSDictionary *)params Success:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure {

    if (network.mdf_loadingAnimation == YES) {
        [SVProgressHUD showWithStatus:@"加载中"];
    }
    [network startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        if (network.mdf_loadingAnimation == YES) {
            [SVProgressHUD dismiss];
        }
        
        if (network.mdf_tipPopup == YES) {
            [SVProgressHUD showSuccessWithStatus:request.responseString];
        }
        
        if (success) {
            success(request);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        if (network.mdf_loadingAnimation == YES) {
            [SVProgressHUD dismiss];
        }
        
        if (network.mdf_tipPopup == YES) {
            [SVProgressHUD showErrorWithStatus:request.responseString?:@"请求失败"];
        }
        
        if (failure) {
            failure(request);
        }
    }];
}

- (MDFNetwork *)shareNetworkWithUrl:(NSString *)url parameters:(NSDictionary *)params{
    
    MDFNetwork *network = [[MDFNetwork alloc] init];
    network.mdf_requestUrl = url;
    network.mdf_params = params;
    return network;
}
@end
