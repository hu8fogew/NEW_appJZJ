//
//  teacherHeaderView.h
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherHeaderView : UIView

/*开头介绍*/
@property (strong,nonatomic) UILabel *titleLabel;

/*资质介绍*/
@property (strong,nonatomic) UILabel *levelLabel;
@property (strong,nonatomic) UILabel *levelDetailLabel;

/*个人简介*/
@property (strong,nonatomic) UILabel *resumeLabel;
@property (strong,nonatomic) UILabel *resumeDetailLabel;

/*擅长*/
@property (strong,nonatomic) UILabel *goodLabel;
@property (strong,nonatomic) UILabel *goodDetailLabel;

/*评价*/
@property (strong,nonatomic) UILabel *commentLabel;

/*评论按钮*/
@property (strong,nonatomic) UIButton *commentBtn;
@end
