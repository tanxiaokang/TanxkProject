//
//  main.m
//  临时计算用
//
//  Created by tanxk on 2019/8/231.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int count = 100;
        /**
         0  1  2  3  4
         5  6  7  8  9
         10 11 12 13 14
         .
         .
         .
         
         计算出 1 2 3 6 7 8 11 12 13 。。。。
         */
        
        NSInteger sizeCount = 5;
        
        for (int i=0; i<count; i++) {
            //排除0 5 10 。。。
            //排除4 9 14 。。。
            if (((i+1)%sizeCount==0) == NO &&
                ((i+0)%sizeCount==0) == NO) {
                NSLog(@"%d",i);
            }
        }
    }
    return 0;
}
