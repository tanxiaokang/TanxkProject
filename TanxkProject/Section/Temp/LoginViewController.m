//
//  LoginViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/536.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
}

- (IBAction)logClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    LoginViewController *vc =  [LoginViewController new];
//    vc.title = @"登录2";
//    [self presentViewController:vc animated:YES completion:nil];
    
//    return;
//    if (self.navigationController.viewControllers.count != 1) {
//        [self.navigationController popViewControllerAnimated:YES];
//    } else {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
