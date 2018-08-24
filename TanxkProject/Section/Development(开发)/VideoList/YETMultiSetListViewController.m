//
//  YETMultiSetListViewController.m
//  YueErTang
//
//  Created by tanxiaokang on 2018/7/227.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import "YETMultiSetListViewController.h"
#import "YETMuitiSetListHeaderCell.h"
#import "YETMuitiSetListSourceCatalogCell.h"
#import "YETMuitiSetListRecommendationCell.h"

@interface YETMultiSetListViewController ()

@end

@implementation YETMultiSetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.base_dataSource =  [NSMutableArray array];
    [self.base_tableView setBounces:NO];
    self.base_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.base_tableView.layer.cornerRadius = 3.f;
    
    [self.base_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.right.bottom.offset(-0);
    }];
    
    [self.base_tableView registerNib:[UINib nibWithNibName:@"YETMuitiSetListRecommendationCell" bundle:nil] forCellReuseIdentifier:@"YETMuitiSetListRecommendationCell"];
    [self.base_tableView registerNib:[UINib nibWithNibName:@"YETMuitiSetListHeaderCell" bundle:nil] forCellReuseIdentifier:@"YETMuitiSetListHeaderCell"];
    [self.base_tableView registerNib:[UINib nibWithNibName:@"YETMuitiSetListSourceCatalogCell" bundle:nil] forCellReuseIdentifier:@"YETMuitiSetListSourceCatalogCell"];
    
    for (int i=0; i<3; i++) {
        [self.base_dataSource addObject:[MDFBaseTableViewCellModel new]];
    }
    
    [self.base_tableView reloadData];
}

#pragma mark - UITableViewDataSource、Delegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MDFBaseTableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"YETMuitiSetListHeaderCell"];
    } else if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"YETMuitiSetListSourceCatalogCell"];
    } else if (indexPath.row == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"YETMuitiSetListRecommendationCell"];
    }
    
    if (cell == nil) {
        
        switch (indexPath.row) {
            case 0:{
                cell = [MDFBaseTableViewCell cellForRowAtNibName:NSStringFromClass([YETMuitiSetListHeaderCell class])];
                cell.cellModel = [MDFBaseTableViewCellModel new];
            }
                break;
            case 1: {
                cell = [MDFBaseTableViewCell cellForRowAtNibName:NSStringFromClass([YETMuitiSetListSourceCatalogCell class])];
                cell.cellModel = [MDFBaseTableViewCellModel new];
            }
                break;
            case 2: {
                cell = [MDFBaseTableViewCell cellForRowAtNibName:NSStringFromClass([YETMuitiSetListRecommendationCell class])];
                cell.cellModel = [MDFBaseTableViewCellModel new];
                [cell setBase_ActionBlock:^(id model, ...) {
                    [self.base_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:2 inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
                }];
            }
                break;
            default:
                break;
        }
    }
    return cell;
}
@end
