//
//  MDFBaseTableViewCell.h
//  Banknote
//
//  Created by tanxiaokang on 2017/11/17.
//  Copyright © 2017年 runnongjinfu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFBaseTableViewCell.h"
#import "MDFBaseTableViewCellModel.h"

@protocol MDFBaseTableViewCellConfigDataDelegate<NSObject>

- (NSDictionary *)configData:(id)cell;

@end

@interface MDFBaseTableViewCell : UITableViewCell

+ (instancetype)cellForRowAtNibName:(NSString *)name;

@property (nonatomic, strong) MDFBaseTableViewCellModel *cellModel; ///< cell中附加的事件

@property (nonatomic, copy) void ((^Base_ActionBlock)(id model,...));

@property (nonatomic, weak) id<MDFBaseTableViewCellConfigDataDelegate> delegate;

@end
