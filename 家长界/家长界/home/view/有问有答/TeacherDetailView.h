//
//  TeacherDetailView.h
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherDetailView : UIView

/*返回按钮*/
@property (nonatomic,strong) UIButton *backBtn;

/*老师图像*/
@property (nonatomic,strong) UIImageView *imgView;

/*更多*/
@property (nonatomic,strong) UIButton *moreBtn;

/*老师名字*/
@property (nonatomic,strong) UILabel *nameLabel;

/*男女图标*/
@property (nonatomic,strong) UIImageView *iconView;

/*称号*/
@property (nonatomic,strong) UILabel *titleLabel;

/*好评*/
@property (nonatomic,strong) UILabel *commentLabel;

/*第一条分割线*/
@property (nonatomic,strong) UIView *firstView;

/*咨询*/
@property (nonatomic,strong) UILabel *consultLabel;

/*第二条分割线*/
@property (nonatomic,strong) UIView *secondView;

/*赞*/
@property (nonatomic,strong) UILabel *likeLabel;



@end
