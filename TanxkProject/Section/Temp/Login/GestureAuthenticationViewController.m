//
//  GestureAuthenticationViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/536.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "GestureAuthenticationViewController.h"
#import "LoginViewController.h"

@interface GestureAuthenticationViewController ()

@end

@implementation GestureAuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)Clicked:(UIButton *)sender {
    
    [self jumpLogin];
}

- (void)jumpLogin {
    
    if (self.presentedViewController == nil) {
        
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
        [self presentViewController:nvc animated:YES completion:nil];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self Clicked:nil];
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
