//
//  TXKMasonryViewController.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/2230.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKMasonryViewController.h"
#import "TXKMasonryView1.h"
#import "TXKMasonryView2.h"

@interface TXKMasonryViewController ()

@property (nonatomic, strong) UIView *tempView;

@end

@implementation TXKMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    _tempView = view;
    
    TXKMasonryView1 *view1 = [TXKMasonryView1 new];
    [view1 setBackgroundColor:UIColor.redColor];
    [self.view addSubview:view1];
    
    TXKMasonryView2 *view2 = [TXKMasonryView2 new];
    [view2 setBackgroundColor:UIColor.redColor];
    [self.view addSubview:view2];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.equalTo(view.mas_bottom).offset(10);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.equalTo(view1.mas_bottom).offset(10);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
}

- (IBAction)btnClicked:(UIButton *)sender {
    [self.tempView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
    }];
}

@end
