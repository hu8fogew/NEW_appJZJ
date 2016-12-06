//
//  XCAudioPlayer.m
//  家长界
//
//  Created by mac on 2016/12/6.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "XCAudioPlayer.h"
#define Bottom_Height    (self.bounds.size.height * 0.18)
#define TOP_TITLE_HEIGHT (self.bounds.size.height * 0.15)
#define ANIMATE_TIME     5.0


@interface XCAudioPlayer()

@property (nonatomic, strong) XCMarqueeView           *topVideoTitleView;//顶部视频标题view
@property (nonatomic, strong) XZPlayProgressView      *progressView;//底部进度条
@end
@implementation XCAudioPlayer

+(instancetype)shareManager
{
    static XCAudioPlayer *playerAudio = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playerAudio = [[XCAudioPlayer alloc]init];
    });
    
    return playerAudio;
}

#pragma mark /*******progressView底部视图*****/

-(XZPlayProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[XZPlayProgressView alloc]init];
        _progressView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        _progressView.frame = CGRectMake(0, self.height-Bottom_Height, self.width, Bottom_Height);
        /*
        [_progressView.playBtn addTarget:self action:@selector(playBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchDownClick:) forControlEvents:UIControlEventTouchDown];
        [_progressView.progressSlider addTarget:self action:@selector(sliderValueChangedClick:) forControlEvents:UIControlEventValueChanged];
        [_progressView.progressSlider addTarget:self action:@selector(sliderCancledClick:) forControlEvents:UIControlEventTouchCancel];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchInsideClick:) forControlEvents:UIControlEventTouchUpInside];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchOutsideClick:) forControlEvents:UIControlEventTouchUpOutside];
         */
        [self addSubview:_progressView];
        
    }
    return _progressView;
}

#pragma mark /*********播放按钮的暂停和播放********/

- (void)playBtnClicked:(UIButton *)sender{
//    if (self.avPlayer.rate != 0) {
    sender.selected = NO;
    
    if (sender.selected == NO) {
        sender.selected = !sender.selected;
//        [self pause];
        [self.topVideoTitleView resume];
        [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateNormal];
    }else{
//        [self play];
        [self.topVideoTitleView resumeAndStart];
        [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
    }
}


@end
