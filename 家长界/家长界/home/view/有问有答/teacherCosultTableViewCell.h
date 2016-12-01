//
//  teacherCosultTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherCosultTableViewCell : UITableViewCell

/*老师图像*/
@property (strong,nonatomic) UIImageView *imgView;

/*姓名*/
@property (strong,nonatomic) UILabel *nameLabel;

/*点赞图标*/
@property (strong,nonatomic) UIImageView *iconImage;

/*点赞个数*/
@property (strong,nonatomic) UILabel *numberLabel;

/*问题*/
@property (strong,nonatomic) UILabel *questionLabel;

/*回答*/
@property (strong,nonatomic) UILabel *answerLabel;

@end
