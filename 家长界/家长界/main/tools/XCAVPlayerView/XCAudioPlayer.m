//
//  XCAVPlayerView.m
//  PlayerTest
//
//  Created by wangwenke on 16/7/13.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import "XCAudioPlayer.h"


#define Bottom_Height    (self.bounds.size.height * 0.18)
#define TOP_TITLE_HEIGHT (self.bounds.size.height * 0.15)
#define ANIMATE_TIME     5.0




@interface XCAudioPlayer()

//@property (nonatomic, strong) AVPlayerLayer           *avPlayerLayer;
@property (nonatomic, strong) AVPlayer                *auPlayer;
@property (nonatomic, strong) AVPlayerItem            *playerItem;
@property (nonatomic, strong) XCMarqueeView           *topVideoTitleView;//顶部视频标题view
@property (nonatomic, strong) XZPlayProgressView      *progressView;//底部进度条
@property (nonatomic, strong) UIActivityIndicatorView *activityView;//进度轮
@property (nonatomic, strong) UIButton                *resumeBtn;
//@property (nonatomic, strong) UIView                  *xzSuperView;
@property (nonatomic, assign) BOOL                    canEditProgressView;
@property (nonatomic, assign) BOOL                    isDragSlider;

@property (nonatomic, assign) CGPoint lastTouchPoint;
@property (nonatomic, assign, readwrite) TouchesAudioState touchesState;

@end

@implementation XCAudioPlayer

+ (instancetype)shareAudioManager
{
    static XCAudioPlayer *auPlayerView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        auPlayerView = [[XCAudioPlayer alloc]init];
    });
    return auPlayerView;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setVolum];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setVolum];
    }
    return self;
}

- (UIActivityIndicatorView *)activityView{
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc]init];
        _activityView.bounds = self.bounds;
        _activityView.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        [_activityView stopAnimating];
        _activityView.hidesWhenStopped = YES;
        _activityView.userInteractionEnabled = NO;
        [self addSubview:_activityView];
    }
    return _activityView;
}

- (XZPlayProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[XZPlayProgressView alloc]init];
        _progressView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        _progressView.frame = CGRectMake(0, playViewHeight - Bottom_Height, SCREEN_WIDTH, Bottom_Height);
        [_progressView.playBtn addTarget:self action:@selector(playBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [_progressView.fullBtn removeFromSuperview];
        [_progressView.fullBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchDown:) forControlEvents:UIControlEventTouchDown];
        [_progressView.progressSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_progressView.progressSlider addTarget:self action:@selector(sliderCancled:) forControlEvents:UIControlEventTouchCancel];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchInside:) forControlEvents:UIControlEventTouchUpInside];
        [_progressView.progressSlider addTarget:self action:@selector(sliderTouchOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [self addSubview:_progressView];
    }
    return _progressView;
}

- (XCMarqueeView *)topVideoTitleView{
    if (!_topVideoTitleView) {
        NSString *titleStr = _audioTitle?_audioTitle:@" ";
        _topVideoTitleView = [[XCMarqueeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOP_TITLE_HEIGHT) andRaceTitle:titleStr];
        _topVideoTitleView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self addSubview:_topVideoTitleView];
    }
    return _topVideoTitleView;
}

- (UIButton *)resumeBtn{
    if (!_resumeBtn) {
        _resumeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resumeBtn.hidden = YES;
        _resumeBtn.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
        _resumeBtn.frame = self.bounds;
        [_resumeBtn setImage:[UIImage imageNamed:@"icon_repeat_video"] forState:UIControlStateNormal];
        [_resumeBtn setImageEdgeInsets:UIEdgeInsetsMake(self.bounds.size.height / 2.0 - 37.0, self.bounds.size.width / 2.0 - 25.0, self.bounds.size.height / 2.0 - 37.0, self.bounds.size.width / 2.0 - 25.0)];
        [_resumeBtn addTarget:self action:@selector(resumeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_resumeBtn];
    }
    [self bringSubviewToFront:_resumeBtn];
    return _resumeBtn;
}

- (void)setVolum{
    self.clipsToBounds = YES;
    self.isShowTopTitleProgressView = YES;
    self.isShowBottomProgressView   = YES;
    self.isShowResumViewAtPlayEnd   = YES;
    self.touchesState = XCTouchesAudioStateUnKnow;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback
             withOptions:AVAudioSessionCategoryOptionMixWithOthers
                   error:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playerPlayToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterbackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}
-(void)setAudioTitle:(NSString *)audioTitle
{
    _audioTitle = audioTitle;
    [self.topVideoTitleView changeRaceTitle:audioTitle];
}

-(void)setAutioPlayerUrl:(NSString *)autioPlayerUrl
{
    if (autioPlayerUrl) {
        _autioPlayerUrl = autioPlayerUrl;
        if (_auPlayer) {
            [_auPlayer pause];
//            [_avPlayerLayer removeFromSuperlayer];
            [self.playerItem removeObserver:self forKeyPath:@"status"];
            [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
            _totalDuration = 0.0f;
            _timeInterval = 0.0f;
            _currentPlayTime = 0.0f;
            [self.auPlayer.currentItem cancelPendingSeeks];
            [self.auPlayer.currentItem.asset cancelLoading];
            self.auPlayer = nil;
        }
        self.resumeBtn.hidden = YES;
        self.canEditProgressView = YES;
        [self hiddenProgressView:NO];
        self.canEditProgressView = NO;
        [self.activityView startAnimating];
        NSURL *playerUrl = [NSURL URLWithString:self.autioPlayerUrl];
        _playerItem = [[AVPlayerItem alloc]initWithURL:playerUrl];
        _auPlayer = [[AVPlayer alloc]initWithPlayerItem:_playerItem];
        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];//监听status属性
        [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];//监听loadedTimeRanges属性
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(currentXCPlayerTime) object:nil];
        [self currentXCPlayerTime];
        
        [self bringSubviewToFront:self.progressView];
        [self bringSubviewToFront:self.topVideoTitleView];
        [self bringSubviewToFront:self.activityView];
    }
}

- (void)setIsShowBottomProgressView:(BOOL)isShowBottomProgressView{
    _isShowBottomProgressView = isShowBottomProgressView;
    self.progressView.hidden = !isShowBottomProgressView;
}

- (void)setIsShowTopTitleProgressView:(BOOL)isShowTopTitleProgressView{
    _isShowTopTitleProgressView = isShowTopTitleProgressView;
    self.topVideoTitleView.hidden = !isShowTopTitleProgressView;
}

- (void)setIsShowResumViewAtPlayEnd:(BOOL)isShowResumViewAtPlayEnd{
    _isShowResumViewAtPlayEnd = isShowResumViewAtPlayEnd;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    CGRect frame = self.progressView.frame;
    CGRect titleFrame = self.topVideoTitleView.frame;
    self.topVideoTitleView.frame = CGRectMake(titleFrame.origin.x, 0, SCREEN_WIDTH, TOP_TITLE_HEIGHT);
    self.progressView.frame = CGRectMake(frame.origin.x, playViewHeight - Bottom_Height, SCREEN_WIDTH, Bottom_Height);
    self.activityView.bounds = self.bounds;
    self.activityView.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    self.resumeBtn.frame = self.bounds;
}

/** 播放 */
- (void)play{
    if (_auPlayer) {
        [_auPlayer play];
        self.resumeBtn.hidden = YES;
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(currentXCPlayerTime) object:nil];
        [self performSelector:@selector(currentXCPlayerTime) withObject:nil afterDelay:0.5];
    }
}

/** 暂停 */
- (void)pause{
    if (_auPlayer) {
        [_auPlayer pause];
    }
    [self.topVideoTitleView resume];
}

/** 重新开始 */
- (void)resume{
    [self.auPlayer seekToTime:kCMTimeZero];
    if (self.auPlayer.rate == 0.0) {
        [self.auPlayer play];
        self.resumeBtn.hidden = YES;
        [self.topVideoTitleView resumeAndStart];
    }
}

/** 播放状态 */
- (BOOL)isPlaying{
    if (self.auPlayer.rate == 0) {
        return NO;
    }
    return YES;
}

#pragma mark  ........-------添加视图
+ (void)startAudioPlayInSuperView:(UIView *)superView{
    if (superView) {
        if ([XCAudioPlayer shareAudioManager].superview) {
            [[XCAudioPlayer shareAudioManager] removeFromSuperview];
        }
        [superView addSubview:[XCAudioPlayer shareAudioManager]];
        [[XCAudioPlayer shareAudioManager] mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).with.insets(UIEdgeInsetsZero);
        }];
        [[XCAudioPlayer shareAudioManager] pause];
    }
}

/** 暂停、播放 */
- (void)playBtnClicked:(UIButton *)sender{
    if (self.auPlayer.rate != 0) {
        [self pause];
        [self.topVideoTitleView resume];
        [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateNormal];
    }else{
        [self play];
        [self.topVideoTitleView resumeAndStart];
        [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
    }
}

- (void)resumeBtnClicked:(UIButton *)sender{
    [self resume];
    sender.hidden = YES;
}

#pragma mark     进度条
- (void)sliderTouchDown:(UISlider *)sender{
    _isDragSlider = YES;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
}
- (void)sliderValueChanged:(UISlider *)sender{
    _isDragSlider = YES;
    self.progressView.currentTimeLabel.text = [self convertTimeToString:self.progressView.progressSlider.currentProgress];
}
- (void)sliderCancled:(UISlider *)sender{
    _isDragSlider = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}
- (void)sliderTouchInside:(UISlider *)sender{
    [self seekToTime:self.progressView.progressSlider.currentProgress];
    _isDragSlider = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}
- (void)sliderTouchOutside:(UISlider *)sender{
    _isDragSlider = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            HWLog(@"XCPlayerStatusReadyToPlay");
            self.totalDuration = floorf(CMTimeGetSeconds(self.playerItem.duration));
            self.progressView.totalDurationLabel.text = [self convertTimeToString:self.totalDuration];
            self.progressView.progressSlider.maxValue = self.totalDuration;
            self.progressView.progressSlider.minValue = 0;
            self.canEditProgressView = YES;
#warning mark  修改了是否显示底部播放视图
            [self showProgressView:NO];
            [self.activityView stopAnimating];
            if (self.delegate && [self.delegate respondsToSelector:@selector(xcAUPlayerView:reloadStatuesChanged:)]) {
                [self.delegate xcAUPlayerView:self reloadStatuesChanged:XCAudioPlayerStatusReadyToPlay];
            }
        }else if ([playerItem status] == AVPlayerStatusFailed) {
            HWLog(@"XCPlayerStatusFailed");
            [self.activityView stopAnimating];
            if (self.delegate && [self.delegate respondsToSelector:@selector(xcAUPlayerView:reloadStatuesChanged:)]) {
                [self.delegate xcAUPlayerView:self reloadStatuesChanged:XCAudioPlayerStatusFailed];
            }
        }else if ([playerItem status] == AVPlayerStatusUnknown){
            HWLog(@"XCPlayerStatusUnknown");
            [self.activityView stopAnimating];
            if (self.delegate && [self.delegate respondsToSelector:@selector(xcAUPlayerView:reloadStatuesChanged:)]) {
                [self.delegate xcAUPlayerView:self reloadStatuesChanged:XCAudioPlayerStatusUnknown];
            }
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSTimeInterval timeInterval = [self availableDuration];//计算缓冲进度
        self.timeInterval = timeInterval;
        self.progressView.progressSlider.cachesValue = self.timeInterval;
        HWLog(@"Time Interval:%f",timeInterval);
    }
}

/** 当前视频播放时长 */
- (void)currentXCPlayerTime{
    self.currentPlayTime = floorf(CMTimeGetSeconds(self.playerItem.currentTime));
    if (self.currentPlayTime < 0) {
        self.currentPlayTime = 0.0;
    }
    if (self.auPlayer.rate != 0) {
        [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateNormal];
    }else{
        [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
    }
    if (!_isDragSlider) {
        self.progressView.progressSlider.currentProgress = self.currentPlayTime;
        self.progressView.currentTimeLabel.text = [self convertTimeToString:self.currentPlayTime];
    }
    HWLog(@"current playTime:%f－－status:%zd",self.currentPlayTime,self.playerItem.status);
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(currentXCPlayerTime) object:nil];
    [self performSelector:@selector(currentXCPlayerTime) withObject:nil afterDelay:0.5];
}

/** 视频缓冲时长 */
- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [[self.auPlayer currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
}

/** 拉动进度条 */
- (void)seekToTime:(CGFloat)seekTime{
    if (_auPlayer) {
        CMTime time = CMTimeMake(seekTime * self.playerItem.currentTime.timescale, self.playerItem.currentTime.timescale);
        [_auPlayer seekToTime:time];
    }
}

#pragma mark--手势
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_isShowBottomProgressView) {
        if ([self.progressView isHidden]) {
            [self showProgressView:YES];
        }else{
            [self hiddenProgressView:YES];
        }
    }
    _lastTouchPoint = [[touches anyObject] locationInView:self];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    CGFloat moveDistanceX = touchPoint.x - _lastTouchPoint.x;
    CGFloat moveDistanceY = touchPoint.y - _lastTouchPoint.y;
    _lastTouchPoint = touchPoint;
    
    if (_touchesState == XCTouchesAudioStateUnKnow) {
        if (ABS(moveDistanceY) > ABS(moveDistanceX) && touchPoint.x > 0.8 * self.bounds.size.width) {
            _touchesState = XCTouchesAudioStateVolume;
        }else if (ABS(moveDistanceX) > ABS(moveDistanceY) && touchPoint.x > 0.2 * self.bounds.size.width && touchPoint.x < 0.8 * self.bounds.size.width){
            _touchesState = XCTouchesAudioStateSpeed;
            _isDragSlider = YES;
            if (![self.progressView isHidden]) {
                [self showProgressView:NO];
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
            }
        }else if (ABS(moveDistanceY) > ABS(moveDistanceX) && touchPoint.x < 0.2 * self.bounds.size.width){
            _touchesState = XCTouchesAudioStateBrightness;
        }
    }
    if (_touchesState == XCTouchesAudioStateBrightness) {
        
    }else if (_touchesState == XCTouchesAudioStateSpeed){
        self.progressView.progressSlider.currentProgress += moveDistanceX * (self.progressView.progressSlider.maxValue / self.bounds.size.width);
    }else if (_touchesState == XCTouchesAudioStateVolume){
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_touchesState == XCTouchesAudioStateSpeed) {
        [self seekToTime:self.progressView.progressSlider.currentProgress];
    }
    _isDragSlider = NO;
    _touchesState = XCTouchesAudioStateUnKnow;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isDragSlider = NO;
    _touchesState = XCTouchesAudioStateUnKnow;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}


#pragma mark---bottom progress view
- (void)hiddenProgressView:(BOOL)animate{
    if (!_canEditProgressView) {
        return;
    }
    _canEditProgressView = NO;
    if (animate) {
        [UIView animateWithDuration:0.2 animations:^{
            self.topVideoTitleView.frame = CGRectMake(0, -TOP_TITLE_HEIGHT, self.topVideoTitleView.bounds.size.width, self.topVideoTitleView.bounds.size.height);
            self.progressView.frame = CGRectMake(0, self.bounds.size.height, self.progressView.bounds.size.width, self.progressView.bounds.size.height);
        } completion:^(BOOL finished) {
            self.progressView.hidden = YES;
            self.topVideoTitleView.hidden = YES;
            self.canEditProgressView = YES;
        }];
    }else{
        self.progressView.hidden = YES;
        self.canEditProgressView = YES;
        self.topVideoTitleView.frame = CGRectMake(0, -TOP_TITLE_HEIGHT, self.topVideoTitleView.bounds.size.width, self.topVideoTitleView.bounds.size.height);
        self.progressView.frame = CGRectMake(0, self.bounds.size.height, self.progressView.bounds.size.width, self.progressView.bounds.size.height);
    }
    
}

- (void)showProgressView:(BOOL)animate{
    if (!_canEditProgressView) {
        return;
    }
    _canEditProgressView = NO;
    self.progressView.hidden = !_isShowBottomProgressView;
    self.topVideoTitleView.hidden = !_isShowTopTitleProgressView;
    if (animate) {
        [UIView animateWithDuration:0.2 animations:^{
            self.topVideoTitleView.frame = CGRectMake(0, 0, self.topVideoTitleView.bounds.size.width, TOP_TITLE_HEIGHT);
            self.progressView.frame = CGRectMake(0, playViewHeight - Bottom_Height, SCREEN_WIDTH, Bottom_Height);
        } completion:^(BOOL finished) {
            self.canEditProgressView = YES;
        }];
    }else{
        self.topVideoTitleView.frame = CGRectMake(0, 0, self.topVideoTitleView.bounds.size.width, TOP_TITLE_HEIGHT);
        self.progressView.frame = CGRectMake(0, playViewHeight - Bottom_Height, SCREEN_WIDTH, Bottom_Height);
        self.canEditProgressView = YES;
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenProgressView:) object:self];
    [self performSelector:@selector(hiddenProgressView:) withObject:self afterDelay:ANIMATE_TIME];
}

#pragma notification
/** 视频播放结束 */
- (void)playerPlayToEnd:(NSNotification *)notification{
    HWLog(@"play end");
    [self pause];
    [self.auPlayer seekToTime:kCMTimeZero];
    [self.progressView.playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
    self.canEditProgressView = YES;
    [self hiddenProgressView:NO];
    self.resumeBtn.hidden = !_isShowResumViewAtPlayEnd;
    if (self.delegate && [self.delegate respondsToSelector:@selector(xcAUPlayerView:reloadStatuesChanged:)]) {
        [self.delegate xcAUPlayerView:self reloadStatuesChanged:XCAudioPlayerStatusPlayEnd];
    }
}


/** 后台 */
- (void)applicationEnterbackground:(NSNotification *)notification{
    if ([self isPlaying]) {
        [self pause];
    }
}

/** 重制播放器 */
- (void)resumAllPlayerValues{
    if ([self isPlaying]) {
        [self pause];
    }
    _totalDuration = 0.0f;
    _timeInterval = 0.0f;
    _currentPlayTime = 0.0f;
    [self.auPlayer.currentItem cancelPendingSeeks];
    [self.auPlayer.currentItem.asset cancelLoading];
}


- (void)dealloc{
    [self pause];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    if (_auPlayer) {
        [_auPlayer pause];
        [self.playerItem removeObserver:self forKeyPath:@"status"];
        [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
        [self.auPlayer.currentItem cancelPendingSeeks];
        [self.auPlayer.currentItem.asset cancelLoading];
        self.auPlayer = nil;
    }
}

@end
