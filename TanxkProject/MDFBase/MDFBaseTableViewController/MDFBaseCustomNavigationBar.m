//
//  MDFBaseCustomNavigationBar.m
//  AwesomeRecycling
//
//  Created by JZG-users on 2018/1/14.
//  Copyright © 2018年 RunNong. All rights reserved.
//

#import "MDFBaseCustomNavigationBar.h"

#define isIphoneX   CGRectEqualToRect([UIScreen mainScreen].bounds, CGRectMake(0, 0, 375, 812))

#define kMDFDefaultTitleSize 18
#define kMDFDefaultTitleColor [UIColor blackColor]
#define kMDFDefaultBackgroundColor [UIColor whiteColor]
#define kMDFScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation UIViewController (WRRoute)

- (void)mdf_toLastViewController
{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if(self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

+ (UIViewController*)mdf_currentViewController
{
    UIViewController* rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self mdf_currentViewControllerFrom:rootViewController];
}

+ (UIViewController*)mdf_currentViewControllerFrom:(UIViewController*)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self mdf_currentViewControllerFrom:navigationController.viewControllers.lastObject];
    }
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self mdf_currentViewControllerFrom:tabBarController.selectedViewController];
    }
    else if (viewController.presentedViewController != nil) {
        return [self mdf_currentViewControllerFrom:viewController.presentedViewController];
    }
    else {
        return viewController;
    }
}

@end

@interface MDFBaseCustomNavigationBar ()
@property (nonatomic, strong) UILabel     *titleLable;
@property (nonatomic, strong) UIView      *bottomLine;
@property (nonatomic, strong) UIView      *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@end

@implementation MDFBaseCustomNavigationBar

+ (instancetype)CustomNavigationBar {
    MDFBaseCustomNavigationBar *navigationBar = [[self alloc] initWithFrame:CGRectMake(0, 0, kMDFScreenWidth, [MDFBaseCustomNavigationBar navBarBottom])];
    return navigationBar;
}
- (instancetype)init {
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    [self addSubview:self.backgroundView];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.titleLable];
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
    [self addSubview:self.bottomLine];
    [self updateFrame];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView.backgroundColor = kMDFDefaultBackgroundColor;
    self.backgroundAlpha = 1;
}

// TODO:这边结合 WRCellView 会不会更好呢？
-(void)updateFrame
{
    NSInteger top = isIphoneX ? 44 : 20;
    NSInteger margin = 0;
    NSInteger buttonHeight = 44;
    NSInteger buttonWidth = 50;
    NSInteger titleLabelHeight = 44;
    NSInteger titleLabelWidth = 180;
    
    self.backgroundView.frame = self.bounds;
    self.backgroundImageView.frame = self.bounds;
    self.leftButton.frame = CGRectMake(margin, top, buttonWidth, buttonHeight);
    self.rightButton.frame = CGRectMake(kMDFScreenWidth - buttonWidth - 5, top, buttonWidth, buttonHeight);
    self.titleLable.frame = CGRectMake((kMDFScreenWidth - titleLabelWidth) / 2, top, titleLabelWidth, titleLabelHeight);
    self.bottomLine.frame = CGRectMake(0, (CGFloat)(self.bounds.size.height-0.5), kMDFScreenWidth, 0.5);
}

#pragma mark - 导航栏左右按钮事件
-(void)clickBack {
    if (self.MDF_OnClickLeftButton) {
        self.MDF_OnClickLeftButton();
    } else {
        UIViewController *currentVC = [UIViewController mdf_currentViewController];
        [currentVC mdf_toLastViewController];
    }
}
-(void)clickRight {
    if (self.MDF_OnClickRightButton) {
        self.MDF_OnClickRightButton();
    }
}

- (void)mdf_setBottomLineHidden:(BOOL)hidden {
    self.bottomLine.hidden = hidden;
}

- (void)setBackgroundAlpha:(CGFloat)backgroundAlpha {
    _backgroundAlpha = backgroundAlpha;
    
    self.backgroundView.alpha = backgroundAlpha;
    self.backgroundImageView.alpha = backgroundAlpha;
    self.bottomLine.alpha = backgroundAlpha;
    
    UIViewController *currentVC = [UIViewController mdf_currentViewController];
    if (backgroundAlpha) {
        currentVC.navigationController.navigationBar.translucent = NO;
    }else {
        currentVC.navigationController.navigationBar.translucent = YES;
    }
}

- (void)mdf_setBackgroundAlpha:(CGFloat)alpha {
    self.backgroundAlpha = alpha;
}

- (void)mdf_setTintColor:(UIColor *)color {
    [self.leftButton setTitleColor:color forState:UIControlStateNormal];
    [self.rightButton setTitleColor:color forState:UIControlStateNormal];
    [self.titleLable setTextColor:color];
}

#pragma mark - 左右按钮
- (void)mdf_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor
{
    self.leftButton.hidden = NO;
    [self.leftButton setImage:normal forState:UIControlStateNormal];
    [self.leftButton setImage:highlighted forState:UIControlStateHighlighted];
    [self.leftButton setTitle:title forState:UIControlStateNormal];
    [self.leftButton setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)mdf_setLeftButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    [self mdf_setLeftButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)mdf_setLeftButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted {
    [self mdf_setLeftButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)mdf_setLeftButtonWithImage:(UIImage *)image {
    [self mdf_setLeftButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)mdf_setLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self mdf_setLeftButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}

- (void)mdf_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor
{
    self.rightButton.hidden = NO;
    [self.rightButton setImage:normal forState:UIControlStateNormal];
    [self.rightButton setImage:highlighted forState:UIControlStateHighlighted];
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    [self.rightButton setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)mdf_setRightButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    [self mdf_setRightButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)mdf_setRightButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted {
    [self mdf_setRightButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)mdf_setRightButtonWithImage:(UIImage *)image {
    [self mdf_setRightButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)mdf_setRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self mdf_setRightButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}

#pragma mark - setter
-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLable.hidden = NO;
    self.titleLable.text = _title;
}
- (void)setTitleLabelColor:(UIColor *)titleLabelColor {
    _titleLabelColor = titleLabelColor;
    self.titleLable.textColor = _titleLabelColor;
}
- (void)setTitleLabelFont:(UIFont *)titleLabelFont {
    _titleLabelFont = titleLabelFont;
    self.titleLable.font = _titleLabelFont;
}
-(void)setBarBackgroundColor:(UIColor *)barBackgroundColor {
    self.backgroundImageView.hidden = YES;
    _barBackgroundColor = barBackgroundColor;
    self.backgroundView.hidden = NO;
    self.backgroundView.backgroundColor = _barBackgroundColor;
}
- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage {
    self.backgroundView.hidden = YES;
    _barBackgroundImage = barBackgroundImage;
    self.backgroundImageView.hidden = NO;
    self.backgroundImageView.image = _barBackgroundImage;
}

#pragma mark - getter
-(UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        [_leftButton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.imageView.contentMode = UIViewContentModeCenter;
        _leftButton.hidden = YES;
    }
    return _leftButton;
}
-(UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        [_rightButton addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.imageView.contentMode = UIViewContentModeCenter;
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightButton.hidden = YES;
    }
    return _rightButton;
}
-(UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = kMDFDefaultTitleColor;
        _titleLable.font = [UIFont systemFontOfSize:kMDFDefaultTitleSize];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.hidden = YES;
    }
    return _titleLable;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor colorWithRed:(CGFloat)(218.0/255.0) green:(CGFloat)(218.0/255.0) blue:(CGFloat)(218.0/255.0) alpha:1.0];
    }
    return _bottomLine;
}
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
    }
    return _backgroundView;
}
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.hidden = YES;
    }
    return _backgroundImageView;
}

+ (int)navBarBottom
{
    if (isIphoneX) {
        return 88;
    } else {
        return 64;
    }
}
//+ (BOOL)isIphoneX
//{
//    if (CGRectEqualToRect([UIScreen mainScreen].bounds,CGRectMake(0, 0, 375, 812))) {
//        return YES;
//    } else {
//        return NO;
//    }
//}
@end
