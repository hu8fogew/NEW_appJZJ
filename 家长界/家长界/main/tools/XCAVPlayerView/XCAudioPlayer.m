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

@property (nonatomic, strong) XCMarqueeView           *topVideoTitleView;//顶部音频标题
@property (nonatomic, strong) XZPlayProgressView      *progressView;//底部进度条

//播放器
@property(nonatomic,strong)AVAudioPlayer *audioPlayer;

@property (nonatomic, assign) BOOL                    isDragSlider;
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


-(instancetype)init
{
    self = [super init];
    if (self) {
     
     
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}


#pragma mark /*******progressView底部视图*****/

-(XZPlayProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[XZPlayProgressView alloc]init];
        _progressView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        _progressView.frame = CGRectMake(0, self.height-Bottom_Height, self.width, Bottom_Height);
        
        [_progressView.playBtn addTarget:self action:@selector(playBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_progressView.progressSlider addTarget:self action:@selector(sliderValueChangedClick:) forControlEvents:UIControlEventValueChanged];
  /*
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchDownClick:) forControlEvents:UIControlEventTouchDown];
        
        [_progressView.progressSlider addTarget:self action:@selector(sliderCancledClick:) forControlEvents:UIControlEventTouchCancel];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchInsideClick:) forControlEvents:UIControlEventTouchUpInside];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchOutsideClick:) forControlEvents:UIControlEventTouchUpOutside];
*/
        [self addSubview:_progressView];
    }
    return _progressView;
}

#pragma mark /*********播放按钮的暂停和播放********/

- (void)playBtnClick:(UIButton *)sender{
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


#pragma mark  ///添加跑马灯效果

-(XCMarqueeView *)topVideoTitleView
{
    if (!_topVideoTitleView) {
        NSString *titleStr = _videoTitle?_videoTitle:@" ";
        _topVideoTitleView = [[XCMarqueeView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, TOP_TITLE_HEIGHT) andRaceTitle:titleStr];
        _topVideoTitleView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self addSubview:_topVideoTitleView];
    }
    
    return _topVideoTitleView;
}



#pragma 进度条
- (void)sliderTouchDownClick:(UISlider *)sender{
    _isDragSlider = YES;
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
}
- (void)sliderValueChangedClick:(UISlider *)sender{
    _isDragSlider = YES;
    self.progressView.currentTimeLabel.text = [self convertTimeToString:self.progressView.progressSlider.currentProgress];
}


- (void)sliderCancledClick:(UISlider *)sender{
    _isDragSlider = NO;
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
//    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}
- (void)sliderTouchInsideClick:(UISlider *)sender{
    [self seekToTime:self.progressView.progressSlider.currentProgress];
    _isDragSlider = NO;
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
//    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}
- (void)sliderTouchOutsideClick:(UISlider *)sender{
    _isDragSlider = NO;
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
//    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}



/** 播放时间 00:00:00 */
- (NSString *)convertTimeToString:(CGFloat)second{
    NSDate *pastDate = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (second/3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    NSString *timeString = [formatter stringFromDate:pastDate];
    return timeString;
}


/** 拉动进度条 */
- (void)seekToTime:(CGFloat)seekTime{
    if (_audioPlayer) {
//        CMTime time = [self.audioPlayer currentTime];
//        [_audioPlayer seekToTime:time];
    }
}

@end
