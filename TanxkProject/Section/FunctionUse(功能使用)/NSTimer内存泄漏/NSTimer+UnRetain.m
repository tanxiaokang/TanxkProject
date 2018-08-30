//
//  NSTimer+UnRetain.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "NSTimer+UnRetain.h"

@implementation NSTimer (UnRetain)

+ (NSTimer *)mdf_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                        repeats:(BOOL)repeats
                                          block:(void(^)(NSTimer *timer))block {
    
    //iOS10 中，定时器的 API 新增了 block 方法，实现原理与此类似，这里采用分类为 NSTimer 添加了带有 block 参数的方法，而系统是在原始类中直接添加方法，最终的行为是一致的。
    if (@available(iOS 10.0, *)) {
        //这里用和不用Block copy 有何区别，等待调研 2018年08月30日11:51:19
        return [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:[block copy]];
//        return [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:block];
    } else {
        return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(mdf_blcokInvoke:) userInfo:[block copy] repeats:repeats];
    }
}

+ (void)mdf_blcokInvoke:(NSTimer *)timer {
    
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end
