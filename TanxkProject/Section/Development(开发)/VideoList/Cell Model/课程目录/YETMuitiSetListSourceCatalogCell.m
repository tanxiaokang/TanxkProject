//
//  YETMuitiSetListSourceCatalogCell.m
//  YueErTang
//
//  Created by tanxiaokang on 2018/7/327.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import "YETMuitiSetListSourceCatalogCell.h"

@interface YETMuitiSetListSourceCatalogCell ()

@property (weak, nonatomic) IBOutlet UIView *listView;

@end

@implementation YETMuitiSetListSourceCatalogCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setCellModel:(MDFBaseTableViewCellModel *)cellModel {
    
    NSMutableArray *btnArrays = [NSMutableArray array];
    
    for (int i=0; i<15; i++) {
//        UIButton *btn = [[UIButton alloc] init];
//        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor brownColor];
        UIView *view = [self cellView:[NSString stringWithFormat:@"6-%d《关键期关键帮助》-入园帮助",i+1] Time:@"12分钟"];
        
        [btnArrays addObject:view];
        [self.listView addSubview:view];
    }
    
    [btnArrays mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
    [btnArrays mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(45);
    }];
}

- (UIView *)cellView:(NSString *)title Time:(NSString *)time{
    
    UIView *view = [[UIView alloc] init];
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.text = title;
    leftLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(25);
    }];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.text = time;
    rightLabel.textColor = [UIColor lightGrayColor];
    rightLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLabel.mas_right).offset(20);
        make.top.bottom.offset(0);
    }];
    
    return view;
}
@end
