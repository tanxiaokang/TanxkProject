//
//  NSLayoutConstraint+tools.h
//  TanxkProject
//
//  Created by tanxk on 2019/7/2530.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (tools)

/**
 修改NSLayoutConstraint中multiplier属性
 
 注意：因为重新设置完约束，旧的约束释放了，如果后续还需要修改约束，请在block中把新约束赋值一下。
 
 用法
 
 
 [self.constraint mdf_constraintWithChangeMultiplier:arc4random()%10 com:^(NSLayoutConstraint * _Nonnull newConstraint) {
 self.constraint = newConstraint;
 }];
 
 @param multiplier 比例
 @param com 新约束
 */
- (BOOL)mdf_constraintWithChangeMultiplier:(CGFloat)multiplier com:(void (^)(NSLayoutConstraint *newConstraint))com;

@end

NS_ASSUME_NONNULL_END
