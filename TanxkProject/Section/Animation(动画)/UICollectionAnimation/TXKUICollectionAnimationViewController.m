//
//  TXKUICollectionAnimationViewController.m
//  TanxkProject
//
//  Created by tanxk on 2019/6/1925.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKUICollectionAnimationViewController.h"
#import "TXKCollectionLoadeAnimationViewController.h"

@interface TXKUICollectionAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray <NSString *>*dataSource;

@end

@implementation TXKUICollectionAnimationViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"collection动画";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.dataSource = @[@"载入时使用的动画"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.dataSource[indexPath.row] isEqualToString:@"载入时使用的动画"]) {
        TXKCollectionLoadeAnimationViewController *vc = [TXKCollectionLoadeAnimationViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
