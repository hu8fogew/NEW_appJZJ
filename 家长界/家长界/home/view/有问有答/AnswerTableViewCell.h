//
//  AnswerTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
/*老师头像*/
@property(nonatomic,strong)UIImageView *teacherImage;
/*老师名字*/
@property(nonatomic,strong)UILabel *teacherName;

/*点赞数及点赞图片*/
@property(nonatomic,strong)UIImageView *smallImage;

@property(nonatomic,strong)UILabel *number;

/*问题主标题*/
@property(nonatomic,strong)UILabel *mainLabel;

/*问题详情*/
@property(nonatomic,strong)UILabel *detialLabel;

-(instancetype)initWithFrame:(CGRect)frame;

@end
