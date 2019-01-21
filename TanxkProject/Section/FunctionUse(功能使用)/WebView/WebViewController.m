//
//  WebViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/9/1137.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.runnongjinfu.com.cn/geiliAssess/#/?from=rzjf"]]];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s",__func__);
}

@end
