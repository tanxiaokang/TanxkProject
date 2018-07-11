//
//  MDFBaseTableViewController+LoadPlist.m
//  HappyLoan
//
//  Created by tanxiaokang on 2018/5/1820.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFBaseTableViewController+LoadPlist.h"
#import "MJExtension.h"

@implementation MDFBaseTableViewController (LoadPlist)

- (NSMutableArray *)mdf_loadToModel:(Class)className {
    
    return [self mdf_laodToModel:className
                           Plist:NSStringFromClass([self class])];
}

#pragma mark - Base
- (NSMutableArray *)mdf_laodToModel:(Class)className Plist:(NSString *)plistName{
    
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle]
                                                                     pathForResource:plistName
                                                                     ofType:@"plist"]];
    return [className mj_objectArrayWithKeyValuesArray:array];
}

- (id)mdf_laodDataToDict:(Class)className Plist:(NSString *)plistName{
    
    // json解析
    // 1.读取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"json"];
    // 2.读取数据
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    // 3.解析json数据
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingAllowFragments error:nil];
    
    NSObject *model = [className new];
    return [model mj_setKeyValues:dict[@"resultObj"]];
}

@end
