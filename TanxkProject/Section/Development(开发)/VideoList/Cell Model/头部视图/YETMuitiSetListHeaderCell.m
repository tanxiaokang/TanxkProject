//
//  YETMuitiSetListHeaderCell.m
//  YueErTang
//
//  Created by tanxiaokang on 2018/7/427.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import "YETMuitiSetListHeaderCell.h"

@interface YETMuitiSetListHeaderCell ()
@property (weak, nonatomic) IBOutlet UIImageView *topImageView; //图片
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;//全0集
@property (weak, nonatomic) IBOutlet UILabel *subTitleRightLabel;//已更新至第0集

@end

@implementation YETMuitiSetListHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setCellModel:(MDFBaseTableViewCellModel *)cellModel {
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
