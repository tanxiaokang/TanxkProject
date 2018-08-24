//
//  VVeboTableController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/2434.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "VVeboTableController.h"
#import "VVeboTableView.h"

@interface VVeboTableController ()

@end

@implementation VVeboTableController{
    VVeboTableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[VVeboTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.scrollIndicatorInsets = tableView.contentInset;//指定滚动条在scrollerView中的位置
    [self.view addSubview:tableView];
}

@end
