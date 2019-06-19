//
//  TXKTableviewControllerAtHeader.m
//  TanxkProject
//
//  Created by tanxk on 2019/6/1925.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKTableviewControllerAtHeader.h"

@interface TXKTableviewControllerAtHeader ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *head;
@end

@implementation TXKTableviewControllerAtHeader

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"tab";
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
    UIView *head = [[UIView alloc] init];
    self.tableView.tableHeaderView = head;
    self.head = head;
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.frame.size.width);
        make.height.mas_equalTo(200);
    }];
    UIImageView *headImageView = [[UIImageView alloc] init];
    headImageView.contentMode = UIViewContentModeScaleAspectFit;
    headImageView.image = [UIImage imageNamed:@"bg_home_long"];
    [head addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
    }];
    [self.tableView.tableHeaderView layoutIfNeeded];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.tableView.tableHeaderView.frame.size.height == 200.f) {
//        self.tableView.tableHeaderView.frame = CGRectMake(0, 0, 100, 300);
//    } else {
//        self.tableView.tableHeaderView.frame = CGRectMake(0, 0, 100, 200);
//    }
    
    NSArray *array = [MASViewConstraint installedConstraintsForView:self.tableView];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj uninstall];
    }];
    
    [self.head mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.frame.size.width);
        make.height.mas_equalTo(300);
    }];
    [self.head layoutIfNeeded];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *brand_region_Cell = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:brand_region_Cell];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:brand_region_Cell];
    }
    CGFloat red = ( arc4random() % 255 / 255.0 );
    CGFloat green = ( arc4random() % 255 / 255.0 );
    CGFloat blue = ( arc4random() % 255 / 255.0 );
    
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}
@end
