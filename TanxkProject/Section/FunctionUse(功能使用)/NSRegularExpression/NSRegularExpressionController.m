//
//  NSRegularExpressionController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/8/2434.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "NSRegularExpressionController.h"
#import "NSString+range.h"

@interface NSRegularExpressionController ()

@end

@implementation NSRegularExpressionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSRegularExpression用于将正则表达式用于匹配Unicode字符串，其实例不可更改，且带有初始化时所设定的正则表达式模式以及多个选项标识位。正则语法遵循ICU标准。
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\b(a|b)(c|d)\\b" options:NSRegularExpressionCaseInsensitive error:&error];
    __block NSUInteger count = 0;
    NSString *string = @"baaaaaacb";
    [regex enumerateMatchesInString:string options:0 range:string.mdf_transRange usingBlock:^(NSTextCheckingResult * _Nullable match, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
//        NSRange matchRange = [match range];
//        NSRange firstHalfRange = [match rangeAtIndex:1];
//        NSRange secondHalfRange = [match rangeAtIndex:2];
        if (++count >= 100) {
            *stop = YES;
        }
    }];
}

@end
