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

@property (weak, nonatomic) IBOutlet UIButton *testBbtn;

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
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testClick:(UIButton *)sender {
    
    GestureAuthenticationViewController *vc = [GestureAuthenticationViewController new];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    [vc.testBbtn setTitle:@"test" forState:UIControlStateNormal];
}
- (IBAction)deletebackVC:(id)sender {
    
    UIViewController *vc = self;
    while (vc) {
        if ([vc.title isEqualToString:@"qwe"]) {
            [vc dismissViewControllerAnimated:NO completion:nil];
            break;
        } else {
            vc = ((UIPresentationController *)vc.presentationController).presentingViewController;
            NSLog(@"%@",vc);
            NSLog(@"%@",vc.title);
        }
    }
}
- (IBAction)babck:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
