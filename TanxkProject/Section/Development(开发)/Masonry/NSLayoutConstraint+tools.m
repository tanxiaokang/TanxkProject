//
//  NSLayoutConstraint+tools.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/2530.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "NSLayoutConstraint+tools.h"

@implementation NSLayoutConstraint (tools)

- (BOOL)mdf_constraintWithChangeMultiplier:(CGFloat)multiplier com:(void (^)(NSLayoutConstraint *newConstraint))com {
    
    if (multiplier == 0) {
        NSLog(@"比例设置成0是不允许的");
        return NO;
    }
    
    [NSLayoutConstraint deactivateConstraints:@[self]];
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.firstItem attribute:self.firstAttribute relatedBy:self.relation toItem:self.secondItem attribute:self.secondAttribute multiplier:multiplier constant:self.constant];
    newConstraint.priority = self.priority;
    newConstraint.shouldBeArchived = self.shouldBeArchived;
    newConstraint.identifier = self.identifier;
    [NSLayoutConstraint activateConstraints:@[newConstraint]];
    
    if (com) com(newConstraint);
    
    return YES;
}

@end
