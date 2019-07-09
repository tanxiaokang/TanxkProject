//
//  TXKTXKTableviewAtMasManagerTableViewCell.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/327.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKTXKTableviewAtMasManagerTableViewCell.h"

@interface TXKTXKTableviewAtMasManagerTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIView *conentView;

@end

@implementation TXKTXKTableviewAtMasManagerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CGFloat red = ( arc4random() % 255 / 255.0 );
    CGFloat green = ( arc4random() % 255 / 255.0 );
    CGFloat blue = ( arc4random() % 255 / 255.0 );
    
    self.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
- (void)setItem:(NSString *)item {
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i=0; i<10; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        label.text = [NSString stringWithFormat:@"%d",i];
        CGFloat red = ( arc4random() % 255 / 255.0 );
        CGFloat green = ( arc4random() % 255 / 255.0 );
        CGFloat blue = ( arc4random() % 255 / 255.0 );
        label.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        [self.conentView addSubview:label];
        [array addObject:label];
    }
    [array mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:10 tailSpacing:0];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(100);
        make.right.offset(-100);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
