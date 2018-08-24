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
    tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
    [self.view addSubview:tableView];
    
    UIToolbar *statusBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    [self.view addSubview:statusBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
