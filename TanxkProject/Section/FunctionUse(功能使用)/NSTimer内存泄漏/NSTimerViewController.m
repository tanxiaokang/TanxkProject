//
//  NSTimerViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "NSTimerViewController.h"
#import "NSTimer+UnRetain.h"

@interface NSTimerViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *stopBtn;

@end

@implementation NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(p_stopDoSomeThing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    self.stopBtn = btn;
    
    weakifySelf_UnRetain;
    self.timer = [NSTimer mdf_scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *timer) {
        strongifySelf_UnRetain;
        [self p_doSomeThing];
    }];
}

- (void)p_doSomeThing {
    NSLog(@"%@", NSStringFromClass([self class]));
    [self.stopBtn setTitle:[NSString stringWithFormat:@"关闭：%df",arc4random()/10000] forState:UIControlStateNormal];
}

- (void)p_stopDoSomeThing {
    [self.timer invalidate];
//    self.timer = nil;
}

- (void)dealloc {

    [self.timer invalidate];
}

@end
