//
//  YETMuitiSetListRecommendationCell.m
//  YueErTang
//
//  Created by tanxiaokang on 2018/7/427.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import "YETMuitiSetListRecommendationCell.h"
#import <WebKit/WebKit.h>
@interface YETMuitiSetListRecommendationCell ()<WKUIDelegate, WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;
@property (nonatomic, assign) CGFloat sizeHeight;

@end

@implementation YETMuitiSetListRecommendationCell

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.contentView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.offset(0);
        make.height.mas_equalTo(1000);
    }];
}

#pragma mark - UIWebViewDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [self.webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        CGFloat sizeHeight = [result doubleValue];
        
        if (sizeHeight > self.sizeHeight) {
            
            self.sizeHeight = sizeHeight;
            NSLog(@"开始计算高度");
            
            [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(sizeHeight);
            }];
            
            self.Base_ActionBlock([MDFBaseTableViewCellModel new]);
        }
    }];
}

#pragma mark - Properties
- (void)setCellModel:(MDFBaseTableViewCellModel *)cellModel {

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://blog.csdn.net/kuangdacaikuang/article/details/78805615"]]];
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.opaque = NO;
        _webView.userInteractionEnabled = NO;
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [_webView sizeToFit];
    }
    return _webView;
}

@end


#if 0
// 方法一
UIScrollView *scrollView = (UIScrollView *)object;
CGFloat height = scrollView.contentSize.height;
self.webViewHeight = height;
self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width, height);
[self.base_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:2 inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
#else

// 方法二
//        [_webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//            CGFloat height = [result doubleValue] + 20;
//            self.webViewHeight = height;
//            self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
//            self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
//            self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width, height);
//            [self.base_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:2 inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//        }];
#endif
