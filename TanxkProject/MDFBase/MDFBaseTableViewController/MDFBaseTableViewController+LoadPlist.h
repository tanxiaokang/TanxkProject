//
//  MDFBaseTableViewController+LoadPlist.h
//  HappyLoan
//
//  Created by tanxiaokang on 2018/5/1820.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseTableViewController.h"

@interface MDFBaseTableViewController (LoadPlist)

- (NSMutableArray *)mdf_loadToModel:(Class)className;
- (NSMutableArray *)mdf_laodToModel:(Class)className Plist:(NSString *)plistName;
- (id)mdf_laodDataToDict:(Class)className Plist:(NSString *)plistName;

@end
