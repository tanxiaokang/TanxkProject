//
//  FBTweak+Config.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/527.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "FBTweak+Config.h"
#import "FBTweakInline.h"

@implementation FBTweak (Config)

#pragma mark - 基础配置

#define BNTweakBaseFunctionCategory @"基础配置Category"
#define BNTweakBaseFunctionCollection @"基础配置Collection"

+ (BOOL)bn_clientAnalyticsUtil
{
    return FBTweakValue(BNTweakBaseFunctionCategory, BNTweakBaseFunctionCollection, @"开启控制台打印日志（网络请求）", NO);
}
#pragma mark - 环境切换

#define BNTweakNetworkCategory @"环境切换"
#define BNTweakNetworkSwitchCollection @"业务开关: 优先级\n OnLine > Test > config"

+ (BOOL)mdf_clientHttps {
    return FBTweakValue(BNTweakNetworkCategory, @"HTTPS: 线上线下环境均有效", @"是否使用HTTPS", YES);
}

#pragma mark - 信息查看

#define BNTweakCheckInformationCategory @"信息查看"
#define BNTweakLateRequestCollection @"查看最近请求\n手势说明:单击取消请求信息查看 \n 绿色：请求成功 \n 红色：请求失败 \n 橙色：H5链接  \n\n 注意：信息中‘address’内容首字母为‘/’的接口为旧网络框架记录信息，如：‘/home/index’"

+ (void)bn_lateRequest
{
//    FBTweakAction(BNTweakCheckInformationCategory, BNTweakLateRequestCollection, @"最近请求", ^(){
//        MDFRequestTableViewController *viewController = [[MDFRequestTableViewController alloc] initWithStyle:UITableViewStylePlain];
//        UIViewController *topVC = [UIViewController mdf_toppestViewController];
//        if ([topVC isKindOfClass:[UINavigationController class]]) {
//            UINavigationController *validNav = (UINavigationController *)topVC;
//            [validNav pushViewController:viewController animated:YES];
//        } else {
//            [topVC.navigationController pushViewController:viewController animated:YES];
//        }
//    });
}

#pragma mark - 跳转界面
#define BNTweakAnyJumpCategory @"跳转界面"
#define BNTweakAnyJumpCollection @"获取当前类的所有方法"

+ (void)mdf_jumpPageCarryOut
{
    FBTweakAction(BNTweakAnyJumpCategory, BNTweakAnyJumpCollection, @"执行当前界面的任意方法",^(){
    
//        UIViewController *currentVC = currentViewController();
//        UIViewController *topVC = [UIViewController mdf_toppestViewController];
//        NSLog(@"currentViewController:%@",currentVC);
//        [MDFAnyjump KGetAllMethod:currentVC data:^(NSArray *mArray)
//         {
//             BNAnyJumpTableViewController *tvc = [[BNAnyJumpTableViewController alloc] init];
//             tvc.dataArray = mArray;
//             [tvc setDidSelectRotAtIndexPathBlcok:^(NSString *method,MDFAnyjumpMethodType methodtype){
//
//                 if (methodtype == MDFAnyjumpClassTMethod) {
//                     [MDFAnyjump KSendMsgToCM:currentVC methodName:method];
//                 } else if (methodtype == MDFAnyjumpInstanceMethod) {
//                     [MDFAnyjump KSendMsgToIM:currentVC methodName:method];
//                 }
//
//                 [topVC dismissViewControllerAnimated:YES completion:nil];
//             }];
//             if ([topVC isKindOfClass:[UINavigationController class]]) {
//                 UINavigationController *validNav = (UINavigationController *)topVC;
//                 [validNav pushViewController:tvc animated:YES];
//             } else {
//                 [topVC.navigationController pushViewController:tvc animated:YES];
//             }
//         }];
    });
//    FBTweakAction(BNTweakAnyJumpCategory, BNTweakAnyJumpCollection, @"执行当前界面的任意方法", ^(){
//
//    });
}

#define BNTweakAnyJumpPageCollection @"跳转到任意界面"
+ (void)mdf_jumpPage {
    
//    FBTweakAction(BNTweakAnyJumpCategory, BNTweakAnyJumpPageCollection, @"跳转界面", ^(){
//
//        UIViewController *topVC = [UIViewController mdf_toppestViewController];
//
//        [MDFAnyjump KGetAllMethod:[MDFBaseAPI class] data:^(NSArray *mArray)
//         {
//             BNAnyJumpTableViewController *tvc = [[BNAnyJumpTableViewController alloc] init];
//             tvc.dataArray = mArray;
//             [tvc setDidSelectRotAtIndexPathBlcok:^(NSString *method,MDFAnyjumpMethodType methodtype){
//
//                 if (methodtype == MDFAnyjumpClassTMethod) {
//                     [MDFAnyjump KSendMsgToCM:[MDFBaseAPI class] methodName:method];
//                 } else if (methodtype == MDFAnyjumpInstanceMethod) {
//                     [MDFAnyjump KSendMsgToIM:[MDFBaseAPI class] methodName:method];
//                 }
//             }];
//             if ([topVC isKindOfClass:[UINavigationController class]]) {
//                 UINavigationController *validNav = (UINavigationController *)topVC;
//                 [validNav pushViewController:tvc animated:YES];
//             } else {
//                 [topVC.navigationController pushViewController:tvc animated:YES];
//             }
//         }];
//    });
}

@end
