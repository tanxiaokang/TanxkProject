//
//  YTKNetworkConfig+addFeature.h
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/536.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKNetworkConfig.h"
#import "MDFBaseRequest.h"

@interface YTKNetworkConfig (addFeature)

@property (nonatomic, copy) MDFRequestSignOutBlock signOutBlock;

@end
