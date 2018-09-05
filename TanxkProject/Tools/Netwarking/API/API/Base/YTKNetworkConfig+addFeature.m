//
//  YTKNetworkConfig+addFeature.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/536.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKNetworkConfig+addFeature.h"
#import <objc/runtime.h>

static char *MDFRequestSignOutBlockKey = "MDFRequestSignOutBlockKey";

@implementation YTKNetworkConfig (addFeature)

- (void)setSignOutBlock:(MDFRequestSignOutBlock)signOutBlock{
    /*
     关联方法：
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     
     参数：
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     */
    objc_setAssociatedObject(self, MDFRequestSignOutBlockKey, signOutBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (MDFRequestSignOutBlock)signOutBlock {
    return objc_getAssociatedObject(self, MDFRequestSignOutBlockKey);
}

@end
