//
//  VideoViewController.m
//  TanxkProject
//
//  Created by tanxiaokang on 2018/7/2530.
//  Copyright © 2018年 runze. All rights reserved.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoViewController ()
@property (nonatomic, strong)AVPlayer *player;
@property (nonatomic, strong)UISlider *slider;
@property (nonatomic,assign)CGFloat sumPlayOperation;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置播放的url
    NSURL *url = [NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
    //设置播放的项目
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:url];
    //初始化player对象
    self.player = [[AVPlayer alloc]initWithPlayerItem:item];
    //设置播放页面
    //在开发中，单纯使用AVPlayer类是无法显示视频的，要将视频层添加至AVPlayerLayer中，这样才能将视频显示出来 所以设置AVPlayerLayer播放页面
    AVPlayerLayer *layout = [AVPlayerLayer playerLayerWithPlayer:_player];
    layout.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    layout.backgroundColor = [UIColor cyanColor].CGColor;
    //设置播放窗口和当前视图之间的比例显示内容
    layout.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.view.layer addSublayer:layout];
    self.player.volume = 1.0f;
    //代码块
//    [self.playView play:^(UIButton *play) {
//        [self.player play];
//    } pause:^(UIButton *pause) {
//        [self.player pause];
//    } last:^(UIButton *last) {
//        NSLog(@"上一首");
//    } next:^(UIButton *next) {
//        NSLog(@"下一首");
//    }];w
    //创建slider
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(self.view.center.x - 100, 280, 200, 30)];
    [self.view addSubview:_slider];
    _slider.value = 0.0f;
    [_slider addTarget:self action:@selector(handleSlider:) forControlEvents:UIControlEventTouchUpInside];
    
   
    
}
//改变进度
- (void)handleSlider:(UISlider *)slider {
    self.sumPlayOperation = self.player.currentItem.duration.value / self.player.currentItem.duration.timescale;
    //CMTimeMake(a,b) a表示当前时间，b表示每秒钟有多少帧
    [self.player seekToTime:CMTimeMakeWithSeconds(self.slider.value * self.sumPlayOperation, self.player.currentItem.duration.timescale) completionHandler:^(BOOL finished) {
        [self.player play];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
