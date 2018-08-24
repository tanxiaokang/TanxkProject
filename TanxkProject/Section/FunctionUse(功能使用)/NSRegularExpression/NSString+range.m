//
//  NSString+range.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/2434.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "NSString+range.h"

@implementation NSString (range)

- (NSRange)mdf_transRange{
    
    if (self.length == 0) {
        return NSMakeRange(0, 0);
    }
    
    NSRange range = NSMakeRange(0, self.length);
    return range;
}

@end
