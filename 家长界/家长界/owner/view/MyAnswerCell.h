//
//  MyAnswerCell.h
//  家长界
//
//  Created by mac on 2016/12/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAnswerCell : UITableViewCell


//头像
@property(nonatomic,strong)UIImageView *answerImage;
//发布人
@property(nonatomic,strong)UILabel *nameOfUser;
//发布时间
@property(nonatomic,strong)UILabel *timeLabel;
//发布的设备
@property(nonatomic,strong)UILabel *mechineLabel;
//问题
@property(nonatomic,strong)UILabel *answerLabel;
//删除
@property(nonatomic,strong)UIButton *deleteCell;
//回答：
@property(nonatomic,strong)UILabel *answerText;
//回答详情
@property(nonatomic,strong)UILabel *descAnswer;
//回答时间
@property(nonatomic,strong)UILabel *timeAnswer;

@end
