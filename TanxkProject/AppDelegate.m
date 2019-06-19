//
//  AppDelegate.m
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/327.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import "GestureAuthenticationViewController.h"
#import "ViewControllerA.h"
#import "YTKNetworkConfig+addFeature.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];//这里的bundle 写nil也可以代表是mainBundle
    UITabBarController *tvc = [storyboard  instantiateViewControllerWithIdentifier:@"tabbarvc"];
    
    self.window = [[FBTweakShakeWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tvc;
    [self.window makeKeyAndVisible];
    
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"https://api.runnongjinfu.com";
    config.debugLogEnabled = YES;
    
    [config setSignOutBlock:^(NSInteger code) {
        
//        if (self.window.rootViewController.presentedViewController) {
//            return ;
//        }
        
        printf("\n");
        NSLog(@"parentViewController:%@",       self.window.rootViewController.parentViewController);
        NSLog(@"presentationController:%@",     self.window.rootViewController.presentationController);
        NSLog(@"presentedViewController:%@",    self.window.rootViewController.presentedViewController);
        NSLog(@"presentingViewController:%@",   self.window.rootViewController.presentingViewController);
        printf("\n");
//        GestureAuthenticationViewController *vc = [GestureAuthenticationViewController new];
        ViewControllerA *vc = [ViewControllerA new];
        vc.title = @"qwe";
        [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
