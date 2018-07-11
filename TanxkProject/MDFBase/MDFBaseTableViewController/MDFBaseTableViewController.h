//
//  MDFBaseTableViewController.h
//  Banknote
//
//  Created by tanxiaokang on 2017/11/17.
//  Copyright © 2017年 runnongjinfu. All rights reserved.
//

#import "MDFBaseTableViewCell.h"
#import "MDFBaseTableViewCellModel.h"
#import "LNRefresh.h"


@interface MDFBaseTableViewController : UIViewController

#pragma mark - Data
@property (nonatomic, strong) MDFBaseTableViewCellModel *base_model;
@property (nonatomic, copy) NSString *base_nibNamed;
@property (nonatomic, strong) NSMutableArray *base_dataSource;

#pragma mark - UI
@property (strong, nonatomic) UITableView *base_tableView;

@property (nonatomic, strong) MDFBaseTableViewCell *base_cell;
@property (nonatomic, assign) UITableViewStyle base_style;
@property (nonatomic, strong) UIView *base_headerview;
@property (nonatomic, strong) UIView *base_footerview;
@property (nonatomic, assign) CGFloat base_section_header_viewHeight;
@property (nonatomic, assign) CGFloat base_section_footer_viewHeight;

#pragma mark - Action
@property (nonatomic, copy) void ((^Base_ActionBlock)(id model,...));

///被创建时返回的cell
@property (nonatomic, copy) void ((^Base_cellForRowAtIndexPath)(UITableViewCell *cell));
@property (nonatomic, copy) UIViewController *((^PreviewingBlock)(MDFBaseTableViewCellModel *model));

@end


