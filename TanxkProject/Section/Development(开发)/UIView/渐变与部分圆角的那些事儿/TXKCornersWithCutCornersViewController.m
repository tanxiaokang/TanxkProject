//
//  TXKCornersWithCutCornersViewController.m
//  TanxkProject
//
//  Created by 檀小康 on 2019/8/14.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKCornersWithCutCornersViewController.h"

@interface TXKCornersWithCutCornersViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation TXKCornersWithCutCornersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer* gradinentlayer=[CAGradientLayer layer];
    gradinentlayer.colors=@[(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    //分割点  设置 风电设置不同渐变的效果也不相同
    gradinentlayer.locations=@[@0.2,@0.4,@1.0];
    gradinentlayer.startPoint=CGPointMake(0, 0);
    gradinentlayer.endPoint=CGPointMake(1.0, 0);
    gradinentlayer.frame=CGRectMake(20, 100, 300, 400);
    [self.testView.layer   addSublayer:gradinentlayer];
}

@end
