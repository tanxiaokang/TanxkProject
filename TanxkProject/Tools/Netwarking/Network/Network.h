//
//  Network.h
//  AwesomeInstalment
//
//  Created by VierGhost on 16/10/14.
//  Copyright © 2016年 润农科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <UIKit/UIKit.h>

@class Network;

#define REQUEST_CALLBACK void (^)(Network *response)
typedef void(^NetworkRequestCompletionBlock)(__kindof Network *request);

@interface Network : NSObject

@property(strong, nonatomic) NSDictionary *header;//请求头
@property(assign, nonatomic) NSInteger responCode;//返回值
@property(assign, nonatomic) NSInteger status;//状态值
@property (nonatomic, strong) NSString *state;//请求失败时，状态信息
@property(strong, nonatomic) NSString *message;//请求失败时，返回信息
@property(strong, nonatomic) NSError *error;//请求失败时，错误信息
@property (nonatomic, strong) NSDictionary *dataDic;//主数据


@property (nonatomic, strong)NSData *certData;
@property (nonatomic, strong)NSData *certData_CertificationCenter;  // 认证中心

@property (nonatomic, copy) NetworkRequestCompletionBlock successCompletionBlock;

@property (nonatomic, copy) NetworkRequestCompletionBlock failureCompletionBlock;





+ (Network *)sharedJsonRequest;

+ (BOOL)link:(NSString*)url parameters:(NSDictionary *)params outOfTime:(float)outTime callback:(REQUEST_CALLBACK)callback;
+ (BOOL)linkWithoutLoadingAnimation:(NSString*)url parameters:(NSDictionary *)params outOfTime:(float)outTime callback:(REQUEST_CALLBACK)callback;

#pragma mark 图片上传
+ (BOOL)link:(NSString*)url parameters:(NSDictionary *)params imgParameters:(NSArray *)imgParameters fileNames:(NSArray *)fileNames materialtype:(NSInteger)materialtype outOfTime:(float)outTime callback:(REQUEST_CALLBACK)callback;


- (void)startWithCompletionBlockWithSuccess:(NetworkRequestCompletionBlock)success
                                    failure:(NetworkRequestCompletionBlock)failure;

@end
