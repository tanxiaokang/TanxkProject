//
//  RequestViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/2935.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "RequestViewController.h"
#import "RegisterAPI.h"
#import "QueryBankNameAPI.h"
#import "CheckUserCretStatusAPI.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self link:@"https://xueyezhenbiandujinshu.oss-cn-beijing.aliyuncs.com/xueyue/upgrade.json" parameters:@{@"12":@"21"} Success:^(__kindof YTKBaseRequest * _Nonnull request) {
    //        NSLog(@"%@",request.responseObject);
    //    }];
    
    RegisterAPI *api = [[RegisterAPI alloc] initWithUsername:@"123" password:@"123456"];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    }];
}

- (IBAction)Clicked1:(UIButton *)sender {
    
    [[[CheckUserCretStatusAPI alloc] initWithUserNo:@"10042018062016540286310001"] startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    }];
}

- (IBAction)Clicked2:(UIButton *)sender {
    
    [[[QueryBankNameAPI alloc]initWithBankCard:@"6214830123854209"] startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    }];
}

@end
