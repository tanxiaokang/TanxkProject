//
//  RequestViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/2935.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "RequestViewController.h"
#import "CheckUserCretStatusModel.h"
#import "QueryBankNameModel.h"
#import "LoginModel.h"
#import "Test401Model.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)Clicked1:(UIButton *)sender {
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:TKPUserNo] == nil) {
        
        [[[LoginModel alloc] initWithMobile:@"18810920215" Password:@"123456"] startWithCompletionBlockWithSuccess:^(__kindof LoginItem *item) {
            [sender setTitle:@"退出登录" forState:UIControlStateNormal];
            [[NSUserDefaults standardUserDefaults] setValue:item.userNo forKey:TKPUserNo];
            [[NSUserDefaults standardUserDefaults] setValue:item.token forKey:TKPToken];
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        } failure:nil];
    } else {
        
        [SVProgressHUD showSuccessWithStatus:@"退出登录成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:TKPUserNo];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:TKPToken];
            [sender setTitle:@"去登录" forState:UIControlStateNormal];
        });
    }
   
}

- (IBAction)Clicked2:(UIButton *)sender {
    
    Test401Model *model = [[Test401Model alloc] initWithUserNo:[[NSUserDefaults standardUserDefaults] valueForKey:TKPUserNo]];
    
    [model startWithCompletionBlockWithSuccess:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",item.message]];
    } failure:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",item.message]];
    }];
}

- (IBAction)Clicked3:(UIButton *)sender {
    
    [[[QueryBankNameModel alloc] initWithBankCard:@"6214830123854209"] startWithCompletionBlockWithSuccess:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",item.responseObject]];
    } failure:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",item.message]];
    }];
}

- (IBAction)Clicked4:(UIButton *)sender {
    
    [[[CheckUserCretStatusModel alloc] initWithUserNo:[[NSUserDefaults standardUserDefaults] valueForKey:TKPUserNo]] startWithCompletionBlockWithSuccess:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",item.responseObject]];
    } failure:^(__kindof MDFBaseRequestItem *item) {
        NSLog(@"%@",item.message);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",item.message]];
    }];
}

@end
