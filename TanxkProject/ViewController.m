//
//  ViewController.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/327.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "ViewController.h"
#import "RegisterAPI.h"
#import "YETMultiSetListViewController.h"

@class TPSettingBundleViewController;
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *tableViewItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"TestProject";
    
    [self _buildDataSource];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.offset(64.f);
        
    }];
}

#pragma mark - Handle Data
- (void)_buildDataSource {
    self.tableViewItems = @[@{@"name" : @"Animation - lottie",  @"vc" : @"LottieRootViewController"},
                            @{@"name" : @"Setting.Bundle",      @"vc" : @"TPSettingBundleViewController"}];
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
//    NSString *vcClassName = self.tableViewItems[indexPath.row][@"vc"];
//    Class vcClass = NSClassFromString(vcClassName);
//    if (vcClass) {
//        UIViewController *vc = [[vcClass alloc] init];
//        self.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    [self link:@"https://xueyezhenbiandujinshu.oss-cn-beijing.aliyuncs.com/xueyue/upgrade.json" parameters:@{@"12":@"21"} Success:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseObject);
    }];
    
    //    RegisterAPI *api = [[RegisterAPI alloc] initWithUsername:@"123" password:@"123456"];
    //    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
    //        NSLog(@"%@",request.responseObject);
    //        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    //    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    //        NSLog(@"%@",request.responseObject);
    //        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",request.responseObject]];
    //    }];
    
}

#pragma mark - Properties
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
