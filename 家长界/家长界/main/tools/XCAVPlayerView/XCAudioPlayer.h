//
//  XCAudioPlayer.h
//  家长界
//
//  Created by mac on 2016/12/6.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,XCAudioPlayerStatues){
    XCAudioPlayerStatusReadyToPlay,
    XCAudioPlayerStatusFailed,
    XCAudioPlayerStatusUnknown,
    XCAudioPlayerStatusPlayEnd,
};

typedef NS_ENUM(NSInteger,TouchesAudioState){
    XCTouchesAudioStateVolume,
    XCTouchesAudioStateSpeed,
    XCTouchesAudioStateBrightness,
    XCTouchesAudioStateUnKnow,
};

@class XCAudioPlayer;

@protocol XCAudioPlayerDelegate <NSObject>

/** 播放器状态改变 */
- (void)xcAUPlayerView:(XCAudioPlayer *)playerView reloadStatuesChanged:(XCAudioPlayerStatues)xcPlayerStatues;

/** 播放时间进度改变 */
- (void)xcAUPlayerView:(XCAudioPlayer *)playerView currentPlayTimeChanged:(Float64)currentPlayTime;

@end


@interface XCAudioPlayer : UIView

@property (nonatomic,   copy) NSString *audioTitle;/**< 视频标题 */
@property (nonatomic, strong) NSString *autioPlayerUrl;/**< 播放链接 */
@property (nonatomic, assign) id<XCAudioPlayerDelegate> delegate;
@property (nonatomic, assign) Float64 currentPlayTime;/**< current play time */
@property (nonatomic, assign) Float64 totalDuration;/**< video duration */
@property (nonatomic, assign) Float64 timeInterval;/**< available Duration (cached) */

@property (nonatomic, assign) BOOL    isShowTopTitleProgressView;/**< default is YES */
@property (nonatomic, assign) BOOL    isShowBottomProgressView;/**< default is YES */
@property (nonatomic, assign) BOOL    isShowResumViewAtPlayEnd;/**< default is YES */

@property (nonatomic, assign, readonly) TouchesAudioState touchesState;/**< 手势状态 */


//单例初始化
+(instancetype)shareAudioManager;


//添加到父视图
+ (void)startAudioPlayInSuperView:(UIView *)superView;

/** 播放状态 */
- (BOOL)isPlaying;

/** play */
- (void)play;

/** pause */
- (void)pause;

/** resume */
- (void)resume;

/** 拉动进度条 */
- (void)seekToTime:(CGFloat)seekTime;

/** 播放时间 00:00:00 */
- (NSString *)convertTimeToString:(CGFloat)second;

/** 重制播放器 */
- (void)resumAllPlayerValues;


@end
