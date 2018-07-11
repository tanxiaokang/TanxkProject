//
//  MDFBaseTableViewCell.m
//  Banknote
//
//  Created by tanxiaokang on 2017/11/17.
//  Copyright © 2017年 runnongjinfu. All rights reserved.
//

#import "MDFBaseTableViewCell.h"

@implementation MDFBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

+ (instancetype)cellForRowAtNibName:(NSString *)name {
    
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    MDFBaseTableViewCell *cell = [array firstObject];
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
