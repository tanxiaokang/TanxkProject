//
//  RegisterViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/536.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clicked:(UIButton *)sender {
    
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController;
        [vc dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
