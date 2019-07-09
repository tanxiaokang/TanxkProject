//
//  TXKTableviewAtMasManagerViewController.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/327.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKTableviewAtMasManagerViewController.h"
#import "TXKTXKTableviewAtMasManagerTableViewCell.h"

@interface TXKTableviewAtMasManagerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *head;

@end

@implementation TXKTableviewAtMasManagerViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义cell，有mas管理高度";
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.estimatedRowHeight = 50.0f;
    self.tableView.estimatedSectionFooterHeight = 0.f;
    self.tableView.estimatedSectionHeaderHeight = 0.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView reloadData];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark - Action
- (void)rightItemClicked {
    [self.tableView reloadData];
}
#pragma mark - UITableViewDataSourceDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *brand_region_Cell = @"MyCell";
    
    TXKTXKTableviewAtMasManagerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:brand_region_Cell];
    
    if (cell == nil)
    {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(TXKTXKTableviewAtMasManagerTableViewCell.class) owner:nil options:nil];
        cell = [array firstObject];
    }
    cell.item = @"";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
@end
