//
//  ViewController.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/327.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "ViewController.h"
#import "TXKChainedGrammarManager.h"

@import UIKit.UIView;
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
    
    [TXKChainedGrammarManager manager].addRequest([NSObject new]).addCompletion([NSObject new]);
}

#pragma mark - Handle Data
- (void)_buildDataSource {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SectionDataSource" ofType:@"plist"];
    self.tableViewItems = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
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
    
    NSString *vcClassName = self.tableViewItems[indexPath.row][@"className"];
    
    if ([vcClassName isEqualToString:@"WebViewController"]) {
        Class vcClass = NSClassFromString(vcClassName);
        UIViewController *vc = [[vcClass alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
        return;
    }
    Class vcClass = NSClassFromString(vcClassName);
    if (vcClass) {
        UIViewController *vc = [[vcClass alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
