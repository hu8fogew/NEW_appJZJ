//
//  XCAudioPlayer.h
//  家长界
//
//  Created by mac on 2016/12/6.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCAudioPlayer : UIView

@property (nonatomic,   copy) NSString *videoTitle;/**< 视频标题 */
@property (nonatomic, strong) NSURL *playerUrl;/**< 播放链接 */


@end
