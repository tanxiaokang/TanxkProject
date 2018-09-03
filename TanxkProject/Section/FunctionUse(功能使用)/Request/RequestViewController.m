//
//  RequestViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/2935.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "RequestViewController.h"
#import "QueryBankNameAPI.h"
#import "CheckUserCretStatusModel.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)Clicked1:(UIButton *)sender {
    
    [[[CheckUserCretStatusModel alloc] initWithUserNo:@"10042018062016540286310001"] startWithCompletionBlockWithSuccess:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",item.message]];
    } failure:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",item.message]];
    }];
}

- (IBAction)Clicked2:(UIButton *)sender {
    
//    [[[QueryBankNameAPI alloc]initWithBankCard:@"6214830123854209"] startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"%@",request.responseObject);
//        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"%@",request.responseObject);
//        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
//    }];
}

@end
