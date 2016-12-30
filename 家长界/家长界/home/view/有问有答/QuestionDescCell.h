//
//  QuestionDescCell.h
//  家长界
//
//  Created by mac on 2016/12/1.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetialQuestionLayout;
@interface QuestionDescCell : UITableViewCell
@property(nonatomic,strong)DetialQuestionLayout *wdCellLayout;
@property (nonatomic,strong) NSIndexPath* indexPath;
/*
//头像
@property(nonatomic,strong)UIImageView *imageHead;
//用户类型
@property(nonatomic,strong)UILabel *ueserKind;
//发布时间
@property(nonatomic,strong)UILabel *sendDate;
//问题主标题
@property(nonatomic,strong)UILabel *mainQues;
//问题的详细回答
@property(nonatomic,strong)UILabel *detialAnswer;
//回答个数
@property(nonatomic,strong)UILabel *numOfAnswer;


@property(nonatomic,assign)CGFloat wdCellHight;
*/

@end
