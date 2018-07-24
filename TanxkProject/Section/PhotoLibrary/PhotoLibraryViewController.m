//
//  PhotoLibraryViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/2029.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "PhotoLibraryViewController.h"

@interface PhotoLibraryViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic , assign) NSInteger index;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@end

@implementation PhotoLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"图库";
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
    [self.view addSubview:self.imageView];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:@"1"];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}
#pragma mark - 弹窗
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.center = self.view.center;
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [UIColor blackColor];
        _label.layer.cornerRadius = 4;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.layer.masksToBounds = YES;
        
    }
    return _label;
}
- (void)showInfoWithStatus:(NSString *)msg {
    self.label.text = msg;
    
    [self.view addSubview:self.label];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.9 options:UIViewAnimationOptionCurveEaseOut animations:^
    {
        CGRect frame = self.label.frame;
        frame.size = CGSizeMake(100, 30);
        frame.origin = self.view.center;
        self.label.frame = frame;
        
//        _label.center = self.view.center;
        
    } completion:^(BOOL finished)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
        {
            [UIView animateWithDuration:0.5 animations:^
            {
                CGRect frame = self.label.frame;
                frame.size = CGSizeZero;
                self.label.frame = frame;
            } completion:^(BOOL finished) {
                [self.label removeFromSuperview];
            }];
        });
    }];
}
/**
 1.常规动画属性设置（可以同时选择多个进行设置）
 UIViewAnimationOptionLayoutSubviews：动画过程中保证子视图跟随运动。**提交动画的时候布局子控件，表示子控件将和父控件一同动画。**
 UIViewAnimationOptionAllowUserInteraction：动画过程中允许用户交互。
 UIViewAnimationOptionBeginFromCurrentState：所有视图从当前状态开始运行。
 UIViewAnimationOptionRepeat：重复运行动画。
 UIViewAnimationOptionAutoreverse ：动画运行到结束点后仍然以动画方式回到初始点。**执行动画回路,前提是设置动画无限重复**
 UIViewAnimationOptionOverrideInheritedDuration：忽略嵌套动画时间设置。**忽略外层动画嵌套的时间变化曲线**
 UIViewAnimationOptionOverrideInheritedCurve：忽略嵌套动画速度设置。**通过改变属性和重绘实现动画效果，如果key没有提交动画将使用快照**
 UIViewAnimationOptionAllowAnimatedContent：动画过程中重绘视图（注意仅仅适用于转场动画）。
 UIViewAnimationOptionShowHideTransitionViews：视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除（仅仅适用于转场动画）**用显隐的方式替代添加移除图层的动画效果**
 UIViewAnimationOptionOverrideInheritedOptions ：不继承父动画设置或动画类型。**忽略嵌套继承的�选项**
 ----------------------------------------------------------------------------
 2.动画速度控制（可从其中选择一个设置）时间函数曲线相关**时间曲线函数**
 UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速。
 UIViewAnimationOptionCurveEaseIn ：动画逐渐变慢。
 UIViewAnimationOptionCurveEaseOut：动画逐渐加速。
 UIViewAnimationOptionCurveLinear ：动画匀速执行，默认值。
 -----------------------------------------------------------------------------
 3.转场类型（仅适用于转场动画设置，可以从中选择一个进行设置，基本动画、关键帧动画不需要设置）**转场动画相关的**
 UIViewAnimationOptionTransitionNone：没有转场动画效果。
 UIViewAnimationOptionTransitionFlipFromLeft ：从左侧翻转效果。
 UIViewAnimationOptionTransitionFlipFromRight：从右侧翻转效果。
 UIViewAnimationOptionTransitionCurlUp：向后翻页的动画过渡效果。
 UIViewAnimationOptionTransitionCurlDown ：向前翻页的动画过渡效果。
 UIViewAnimationOptionTransitionCrossDissolve：旧视图溶解消失显示下一个新视图的效果。
 UIViewAnimationOptionTransitionFlipFromTop ：从上方翻转效果。
 UIViewAnimationOptionTransitionFlipFromBottom：从底部翻转效果。
 
 补充：关于最后一组转场动画它一般是用在这个方法中的：
 　　　　[UIView transitionFromView: toView: duration: options:  completion:^(****BOOL****finished) {}];
 该方法效果是插入一面视图移除一面视图，期间可以使用一些转场动画效果。
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";//设置动画的类型
    anima.subtype = kCATransitionFromLeft; //设置动画的方向
    anima.duration = 3;
    [self.view3.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}

/**
 *   设置view的值
 */
-(void)changeView:(BOOL)isUp{
    if (_index>1) {
        _index = 0;
    }
    if (_index<0) {
        _index = 1;
    }
    if (_index == 1) {
        self.view1.frame = self.view3.frame;
        self.view3 = self.view1;
    } else {
        self.view2.frame = self.view3.frame;
        self.view3 = self.view2;
    }
//    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"], nil];
//    self.imageView.image = [images objectAtIndex:_index];
    
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}



@end
