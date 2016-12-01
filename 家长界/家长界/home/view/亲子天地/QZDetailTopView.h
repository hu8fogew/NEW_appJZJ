//
//  QZDetailTopView.h
//  家长界
//
//  Created by taylor on 2016/11/21.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QZDetailTopView : UIView

/*标题*/
@property (nonatomic,strong) UILabel *titleLabel;

/*时间*/
@property (nonatomic,strong) UILabel *timeLabel;

/*浏览*/
@property (nonatomic,strong) UILabel *scanLabel;

/*收藏*/
@property (nonatomic,strong) UIButton *saveBtn;

/*分享*/
@property (nonatomic,strong) UIButton *shareBtn;


@end
