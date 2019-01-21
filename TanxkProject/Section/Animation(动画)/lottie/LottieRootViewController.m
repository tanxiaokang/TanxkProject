//
//  LottieRootViewController.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/1128.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "LottieRootViewController.h"
#import <lottie-ios/Lottie/Lottie.h>
#import "UIView+Utility.h"

@interface LottieRootViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LOTAnimationView *lottieLogo;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *tableViewItems;

@end

@implementation LottieRootViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self _buildDataSource];
    
    [self.view addSubview:self.lottieLogo];
    [self.lottieLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64.f);
        make.left.right.offset(0);
        make.height.equalTo(self.view).multipliedBy(0.3);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lottieLogo.mas_bottom);
        make.left.right.bottom.offset(0);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.lottieLogo play];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.lottieLogo pause];
}
#pragma mark - Handle Data
- (void)_buildDataSource {
    self.tableViewItems = @[@{@"name" : @"Animation Explorer",
                              @"vc" : @"AnimationExplorerViewController"},
                            @{@"name" : @"Animated Keyboard",
                              @"vc" : @"TypingDemoViewController"},
                            @{@"name" : @"Animated Transitions Demo",
                              @"vc" : @"AnimationTransitionViewController"},
                            @{@"name" : @"Animated UIControls Demo",
                              @"vc" : @"LAControlsViewController"},
                            @{@"name" : @"Download Progress Demo",
                              @"vc" : @"LADownloadTestViewController"}];
}

#pragma mark - UITableViewDataSource、Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.tableViewItems[indexPath.row][@"name"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vcClassName = self.tableViewItems[indexPath.row][@"vc"];
    Class vcClass = NSClassFromString(vcClassName);
    if (vcClass) {
        UIViewController *vc = [[vcClass alloc] init];
        [self presentViewController:vc animated:YES completion:NULL];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Properties
- (LOTAnimationView *)lottieLogo {
    if (!_lottieLogo) {
        _lottieLogo = [LOTAnimationView animationNamed:@"home_gold"];
        _lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
        [_lottieLogo mdf_whenSingleTapped:^(UIGestureRecognizer *gestureRecognizer) {
            [SVProgressHUD showInfoWithStatus:@"点击了 LottieLogo1 动画"];
        }];
    }
    return _lottieLogo;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    }
    return _tableView;
}
@end
