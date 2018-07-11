//
//  UIView+Utility.h
//  AwesomeLoan
//
//  Created by tanxiaokang on 2017/11/28.
//  Copyright © 2017年 RunNong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MDFGestureRecognizerActionBlock)(UIGestureRecognizer *gestureRecognizer);
typedef void(^MDFGestureRecognizerConfigBlock)(UIGestureRecognizer *gestureRecognizer);

@interface UIView (Utility)

// 点击
- (void)mdf_whenSingleTapped:(MDFGestureRecognizerActionBlock)block;
- (void)mdf_whenSingleTapped:(MDFGestureRecognizerActionBlock)block gestureConfigBlock:(MDFGestureRecognizerConfigBlock)block;

- (void)mdf_border;

@end
