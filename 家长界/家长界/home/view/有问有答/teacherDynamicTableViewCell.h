//
//  teacherDynamicTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherDynamicTableViewCell : UITableViewCell

/*老师图像*/
@property (strong,nonatomic) UIImageView *imgView;

/*姓名*/
@property (strong,nonatomic) UILabel *nameLabel;

/*时间*/
@property (strong,nonatomic) UILabel *timeLabel;

/*手机*/
@property (strong,nonatomic) UILabel *phoneLabel;

/*信息*/
@property (strong,nonatomic) UILabel *dynamicLabel;

/*转发图标*/
@property (strong,nonatomic) UIImageView *sendImage;

/*转发个数*/
@property (strong,nonatomic) UILabel *sendNoLabel;

/*评论图标*/
@property (strong,nonatomic) UIImageView *commentImage;

/*评论个数*/
@property (strong,nonatomic) UILabel *commentNoLabel;

/*点赞图标*/
@property (strong,nonatomic) UIImageView *praiseImage;

/*点赞个数*/
@property (strong,nonatomic) UILabel *praiseNoLabel;
 


@end
