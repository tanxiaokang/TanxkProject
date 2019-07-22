//
//  TXKMasonryViewController.h
//  TanxkProject
//
//  Created by tanxk on 2019/7/2230.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///此类的作用是总结一些mas的用法
///
///1.同一种类型mas，修改 如设置过高度为50，更新为100
///
///2.当出现约束冲突是，能不能找方案解决：快速定位到哪个控件的约束有问题
///  解决方案: 只需要自定义控件就能准确的定位到哪些控件约束有问题
/**
 Probably at least one of the constraints in the following list is one you don't want.
 Try this:
 (1) look at each constraint and try to figure out which you don't expect;
 (2) find the code that added the unwanted constraint or constraints and fix it.
 (
 "<MASLayoutConstraint:0x600002f3d740 TXKMasonryView2:0x7feef3526b20.right == UIView:0x7feef36194a0.centerX>",
 "<MASLayoutConstraint:0x600002f3dc20 TXKMasonryView2:0x7feef3526b20.right == UIView:0x7feef36194a0.right>",
 "<NSLayoutConstraint:0x600002803f20 UIView:0x7feef36194a0.width == 414>"
 )
 
 Will attempt to recover by breaking constraint
 <MASLayoutConstraint:0x600002f3d740 TXKMasonryView2:0x7feef3526b20.right == UIView:0x7feef36194a0.centerX>
 
 Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
 */
@interface TXKMasonryViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
