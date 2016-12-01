//
//  QuestionDescCell.h
//  家长界
//
//  Created by mac on 2016/12/1.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionDescCell : UITableViewCell
//问答者的图片
@property(nonatomic,strong)UIImageView *quesImage;
//用户名称
@property(nonatomic,strong)UILabel *userNameText;
//用户发布时间
@property(nonatomic,strong)UILabel *timeText;

//问题标题
@property(nonatomic,strong)UILabel *questionText;
//问题详解
@property(nonatomic,strong)UILabel *descQuesText;
//回答人数
@property(nonatomic,strong)UILabel *anserOfNum;

@end
