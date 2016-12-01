//
//  teacherDetailTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherHomeTableViewCell : UITableViewCell

/*老师图像*/
@property (strong,nonatomic) UIImageView *iconImage;

/*名称*/
@property (strong,nonatomic) UILabel *titleLabel;

/*时间*/
@property (strong,nonatomic) UILabel *timeLabel;

/*问题*/
@property (strong,nonatomic) UILabel *questionLabel;

@end
