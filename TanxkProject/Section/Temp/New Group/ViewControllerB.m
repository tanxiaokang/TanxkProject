//
//  ViewControllerB.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/1037.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(UIButton *)sender {
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)remClicked:(UIButton *)sender {
    
    UIViewController *vc = self;
    while (vc) {
        if ([vc isKindOfClass:NSClassFromString(@"ViewControllerA")] == YES) {
            [vc.presentedViewController dismissViewControllerAnimated:NO completion:nil];
            break;
        } else {
//            vc = ((UIPresentationController *)vc.presentationController).presentingViewController;
            
//            NSLog(@"parentViewController:%@",       vc.presentationController.presentedViewController);
//            NSLog(@"presentationController:%@",     vc.presentationController.presentedViewController);
//            NSLog(@"presentedViewController:%@",    vc.presentationController.presentedViewController);
//            NSLog(@"presentingViewController:%@",   vc.presentationController.presentingViewController);
            vc = vc.presentationController.presentingViewController;
        }
    }
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
