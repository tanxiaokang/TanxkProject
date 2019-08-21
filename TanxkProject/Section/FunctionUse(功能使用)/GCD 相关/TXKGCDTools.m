//
//  TXKGCDTools.m
//  TanxkProject
//
//  Created by 檀小康 on 2019/8/13.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKGCDTools.h"

@implementation TXKGCDTools

+ (void)test {
    
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", 0);
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", 0);
    
    NSMutableArray* array = [NSMutableArray array];
    
    dispatch_async(queue1, ^{
        while (true) {
            if (array.count < 10) {
                [array addObject:@(array.count)];
            } else {
                [array removeAllObjects];
            }
        }
    });
    
    dispatch_async(queue2, ^{
        while (true) {
            // case 1
//                    for (NSNumber* number in array) {
//                      NSLog(@"%@", number);
//                    }
            
            // case 2
//                    NSArray* immutableArray = array;
//                    for (NSNumber* number in immutableArray) {
//                      NSLog(@"%@", number);
//                    }
            
            // case 3
            NSArray* immutableArray = [array mutableCopy];
            for (NSNumber* number in immutableArray) {
                NSLog(@"%@", number);
            }
        }
    });
    [[NSRunLoop currentRunLoop] run];
}

@end
