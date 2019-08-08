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
#import "NSLayoutConstraint+tools.h"

@interface TXKMasonryViewController ()

@property (nonatomic, strong) UIView *tempView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;

@end

@implementation TXKMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI3];
}

#pragma mark - 3
- (void)setupUI3 {
    
}


/**
 修改NSLayoutConstraint中multiplier属性
 
 注意：因为重新设置完约束，旧的约束释放了，如果后续还需要修改约束，请在block中把新约束赋值一下。

 @param constraint 需要修改的约束
 @param multiplier 比例
 @param com 新约束
 */
- (void)mdf_constraintWithChangeMultiplierOfConstraint:(NSLayoutConstraint *)constraint multiplier:(CGFloat)multiplier com:(void (^)(NSLayoutConstraint *newConstraint))com {
    
    [NSLayoutConstraint deactivateConstraints:@[constraint]];
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:constraint.firstItem attribute:constraint.firstAttribute relatedBy:constraint.relation toItem:constraint.secondItem attribute:constraint.secondAttribute multiplier:multiplier constant:constraint.constant];
    newConstraint.priority = constraint.priority;
    newConstraint.shouldBeArchived = constraint.shouldBeArchived;
    newConstraint.identifier = constraint.identifier;
    [NSLayoutConstraint activateConstraints:@[newConstraint]];
    if (com) com(newConstraint);
}
#pragma mark - 1、2
- (void)setupUI1_2 {
    
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
    
    [self.constraint mdf_constraintWithChangeMultiplier:arc4random()%10 com:^(NSLayoutConstraint * _Nonnull newConstraint) {
        self.constraint = newConstraint;
    }];
    
//    [self.tempView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(200);
//    }];
}

@end
