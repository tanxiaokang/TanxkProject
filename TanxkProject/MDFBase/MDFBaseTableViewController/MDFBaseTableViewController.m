//
//  MDFBaseTableViewController.m
//  Banknote
//
//  Created by tanxiaokang on 2017/11/17.
//  Copyright © 2017年 runnongjinfu. All rights reserved.
//

#import "MDFBaseTableViewController.h"
#import "Masonry.h"

@interface MDFBaseTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

@end

@implementation MDFBaseTableViewController {
    NSInteger _dataType;  // 1：分组  非1(不包括0)：分组
}

#pragma mark - LifeCycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.base_tableView.tableFooterView = [UIView new];
    self.base_tableView.tableHeaderView = [UIView new];
    self.base_tableView.estimatedRowHeight = 50.0f;
    self.base_tableView.estimatedSectionFooterHeight = 0.f;
    self.base_tableView.estimatedSectionHeaderHeight = 0.f;
    self.base_tableView.rowHeight = UITableViewAutomaticDimension;
    [self registerPreview];
}

#pragma mark - UIViewControllerPreviewingDelegate
-(void)registerPreview{
    if (@available(iOS 9.0, *)) {
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
            [self registerForPreviewingWithDelegate:self sourceView:self.base_tableView];
        }
        else {
            NSLog(@"该设备不支持3D-Touch");
        }
    } else {
        // Fallback on earlier versions
    }
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSIndexPath * indexPath =[_base_tableView indexPathForRowAtPoint:location];
    
    UITableViewCell * cell = [_base_tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        return nil;
    }
    if (self.PreviewingBlock) {
        UIViewController *VC = _PreviewingBlock(self.base_dataSource[indexPath.row]);
        VC.preferredContentSize = CGSizeMake(0, 0);
        if (@available(iOS 9.0, *)) {
            previewingContext.sourceRect = cell.frame;
        } else {
            // Fallback on earlier versions
        }
        return VC;
    } else {
        return nil;
    }
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self.navigationController pushViewController:viewControllerToCommit animated:NO];
}

#pragma mark - UITableViewDataSource、Delegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (self.base_nibNamed == nil) {
        self.base_nibNamed = @"defaultsKey";
    }
    
    MDFBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.base_nibNamed];
    
    if (!cell) {
        cell = [MDFBaseTableViewCell cellForRowAtNibName:self.base_nibNamed];
        if (self.Base_cellForRowAtIndexPath) {
            self.Base_cellForRowAtIndexPath(cell);
        }
    }
    if ([self pdDataSource_Type:self.base_dataSource]) {
        NSArray *sectionArray = [self.base_dataSource objectAtIndex:indexPath.section];
        cell.cellModel = [sectionArray objectAtIndex:indexPath.row];
    } else {
        cell.cellModel = [self.base_dataSource objectAtIndex:indexPath.row];
    }
    
    [self setBase_ActionBlock:self.Base_ActionBlock];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self pdDataSource_Type:self.base_dataSource]) {
        return self.base_dataSource.count;
    }
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self pdDataSource_Type:self.base_dataSource]) {
        NSArray *sectionArray = self.base_dataSource[section];
        return sectionArray.count;
    }
    return self.base_dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (self.base_section_header_viewHeight > 0.f) {
        return self.base_section_header_viewHeight;
    } else {
        return CGFLOAT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (self.base_section_footer_viewHeight > 0.f) {
        return self.base_section_footer_viewHeight;
    } else {
        return CGFLOAT_MIN;
    }
}
#pragma mark - Properties
- (UITableView *)base_tableView {
    
    if (!_base_tableView) {
        
        if ([_base_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            if (@available(iOS 11.0, *)) {
                _base_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
        _base_tableView = [[UITableView alloc] initWithFrame:self.view.frame style:self.base_style];
        _base_tableView.delegate = self;
        _base_tableView.dataSource = self;
        
        [self.view addSubview:_base_tableView];
        
        [_base_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(64);
            make.bottom.offset(self.hidesBottomBarWhenPushed ? 0 : 64);
            make.left.right.offset(0);
        }];
    }
    
    if (@available(iOS 11.0, *)); else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationController.navigationBar.translucent = NO;
    
    return _base_tableView;
}

- (void)setBase_headerview:(UIView *)base_headerview {
    if (!_base_headerview) {
        _base_headerview = base_headerview;
        self.base_tableView.tableHeaderView = _base_headerview;
    }
}

- (void)setBase_footerview:(UIView *)base_footerview {
    if (!_base_footerview) {
        _base_footerview = base_footerview;
        self.base_tableView.tableFooterView = _base_footerview;
    }
}

#pragma mark - Works
-(BOOL)pdDataSource_Type:(NSMutableArray *)dataS {
    if (_dataType) {
        return (_dataType == 1 ? YES : NO);
    }
    if (dataS.count > 0) {
        id tempData = dataS[0];
        if ([tempData isKindOfClass:[NSArray class]]) {
            _dataType = 1;
            return YES;
        }
        _dataType = 2;
        return NO;
    }
    return NO;
}

@end
