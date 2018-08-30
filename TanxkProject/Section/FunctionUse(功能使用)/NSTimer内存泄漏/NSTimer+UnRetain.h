//
//  NSTimer+UnRetain.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/3035.
//  Copyright © 2018年 runze. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义了一个__weak的self_weak_变量
#define weakifySelf_UnRetain \
__weak __typeof(&*self)weakSelf_UnRetain = self;

//局域定义了一个__strong的self指针指向self_weak
#define strongifySelf_UnRetain \
__strong __typeof(&*weakSelf_UnRetain)self = weakSelf_UnRetain;

/** 用法
 
    weakifySelf_UnRetain;
 
    self.timer = [NSTimer mdf_scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *timer) {
 
        strongifySelf_UnRetain;
        //to do something
    }];
 
 */

@interface NSTimer (UnRetain)

/**
 务必在当前线程调用invalidate方法，使得Runloop释放对timer的强引用(具体请参阅官方文档)
 @param inerval 时间
 @param repeats 是否循环
 @param block 回调
 @return Timer对象
 */
+ (NSTimer *)mdf_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                        repeats:(BOOL)repeats
                                          block:(void(^)(NSTimer *timer))block;
@end
