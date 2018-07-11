//
//  MDFBaseCustomNavigationBar.h
//  AwesomeRecycling
//
//  Created by JZG-users on 2018/1/14.
//  Copyright © 2018年 RunNong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFBaseCustomNavigationBar : UIView

@property (nonatomic, copy) void(^MDF_OnClickLeftButton)(void);
@property (nonatomic, copy) void(^MDF_OnClickRightButton)(void);

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UIColor  *titleLabelColor;
@property (nonatomic, strong) UIFont   *titleLabelFont;
@property (nonatomic, strong) UIColor  *barBackgroundColor;
@property (nonatomic, assign) CGFloat  backgroundAlpha;
@property (nonatomic, strong) UIImage  *barBackgroundImage;
@property (nonatomic, strong) UIButton    *leftButton;
@property (nonatomic, strong) UIButton    *rightButton;

+ (instancetype)CustomNavigationBar;
+ (int)navBarBottom;


- (void)mdf_setBottomLineHidden:(BOOL)hidden;
- (void)mdf_setBackgroundAlpha:(CGFloat)alpha;
- (void)mdf_setTintColor:(UIColor *)color;

// 默认返回事件
//- (void)mdf_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor;
//- (void)mdf_setLeftButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
- (void)mdf_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)mdf_setLeftButtonWithImage:(UIImage *)image;
- (void)mdf_setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

//- (void)mdf_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor;
//- (void)mdf_setRightButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
- (void)mdf_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)mdf_setRightButtonWithImage:(UIImage *)image;
- (void)mdf_setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;

@end
