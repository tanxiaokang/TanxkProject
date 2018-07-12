//
//  MDFTabBarController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/1128.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "MDFTabBarController.h"
#import "MDFTweakStoreData.h"

@interface MDFTabBarController ()

@end

@implementation MDFTabBarController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (MDFTweakStoreData *tweak in [[MDFTweakStoreData sharedInstance] getTweakStore]) {
        UIViewController *vc = [[NSClassFromString(tweak.category) alloc] init];
        [self addViewController:vc title:tweak.collection];
    }
}

- (void)addViewController:(UIViewController *)vc title:(NSString *)title{
    vc.title = title;
    [self addChildViewController:vc];
}
@end
