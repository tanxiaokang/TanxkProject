//
//  UIView+Utility.m
//  AwesomeLoan
//
//  Created by tanxiaokang on 2017/11/28.
//  Copyright © 2017年 RunNong. All rights reserved.
//

#import "UIView+Utility.h"

#import <objc/runtime.h>

@implementation UIView (Utility)

- (void)mdf_whenSingleTapped:(MDFGestureRecognizerActionBlock)block
{
    if (!self) {
        NSLog(@"当前视图不存在");
        return;
    }
    [self mdf_whenSingleTapped:block gestureConfigBlock:nil];
}

- (void)mdf_whenSingleTapped:(MDFGestureRecognizerActionBlock)block gestureConfigBlock:(MDFGestureRecognizerConfigBlock)configBlock {
    
    if (!self) {
        NSLog(@"当前视图不存在");
        return;
    }
    
    UITapGestureRecognizer *tapGesture = [self addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(viewWasTapped:)];
    tapGesture.cancelsTouchesInView = NO;
    tapGesture.delaysTouchesBegan = NO;
    tapGesture.delaysTouchesEnded = NO;
    if (configBlock) {
        configBlock(tapGesture);
    }
    [self addRequiredToDoubleTapsRecognizer:tapGesture];
    [self setupBlock:block forKey:@selector(setupBlock:forKey:)];
}

#pragma mark - Helper

- (UITapGestureRecognizer *)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.numberOfTapsRequired = taps;
    tapGesture.numberOfTouchesRequired = touches;
    [self addGestureRecognizer:tapGesture];
    
    return tapGesture;
}

- (void)addRequiredToDoubleTapsRecognizer:(UIGestureRecognizer *)recognizer
{
    for (UIGestureRecognizer *gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer *)gesture;
            if (tapGesture.numberOfTouchesRequired == 2 && tapGesture.numberOfTapsRequired == 1) {
                [recognizer requireGestureRecognizerToFail:tapGesture];
            }
        }
    }
}

- (void)viewWasTapped:(UITapGestureRecognizer *)gesture
{
    MDFGestureRecognizerActionBlock block = objc_getAssociatedObject(self, @selector(setupBlock:forKey:));
    if (block) block(gesture);
}

- (void)setupBlock:(MDFGestureRecognizerActionBlock)block forKey:(void *)blockKey
{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)mdf_border{
    
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
    self.backgroundColor = [UIColor whiteColor];
}
@end
