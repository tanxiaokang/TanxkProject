//
//  MDFNetwork.h
//  尝试封装Network
//
//  Created by tanxiaokang on 2018/7/427.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "YTKRequest.h"

@interface MDFNetwork : YTKRequest

@property (nonatomic, strong) NSString *mdf_requestUrl;
@property (nonatomic, strong) NSDictionary *mdf_params;
@property (nonatomic, assign)  BOOL mdf_loadingAnimation;/**<是否需要加载动画*/
@property (nonatomic, assign)  BOOL mdf_tipPopup;/**<是否需要提示弹窗*/

@end
