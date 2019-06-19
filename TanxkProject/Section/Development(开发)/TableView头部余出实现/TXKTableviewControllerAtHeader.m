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
    head.frame = CGRectMake(0, 0, 100, 200);
    self.tableView.tableHeaderView = head;
//    CGFloat red = ( arc4random() % 255 / 255.0 );
//    CGFloat green = ( arc4random() % 255 / 255.0 );
//    CGFloat blue = ( arc4random() % 255 / 255.0 );
//    head.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    UIImageView *headImageView = [[UIImageView alloc] init];
    headImageView.image = [UIImage imageNamed:@"bg_home_long"];
//    headImageView.frame = CGRectMake(0, -100, 414, 300);
    [head addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
    }];
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
