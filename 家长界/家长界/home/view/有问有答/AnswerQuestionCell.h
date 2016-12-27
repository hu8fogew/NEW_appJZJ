//
//  AnswerQuestionCell.h
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerCellLayout.h"
@interface AnswerQuestionCell : UITableViewCell
@property (nonatomic,strong) AnswerCellLayout* cellLayout;
@property (nonatomic,strong) NSIndexPath* indexPath;
@property (nonatomic,copy) void(^clickedImageCallback)(AnswerQuestionCell* cell,NSInteger imageIndex);
@property (nonatomic,copy) void(^clickedAvatarCallback)(AnswerQuestionCell* cell);
//展开与收起
@property (nonatomic,copy) void(^clickedOpenCellCallback)(AnswerQuestionCell* cell);
@property (nonatomic,copy) void(^clickedCloseCellCallback)(AnswerQuestionCell* cell);
//点赞
@property (nonatomic,copy) void(^clickedEnjoyBtn)(AnswerQuestionCell* cell);
//打赏
@property (nonatomic,copy) void(^clickedLikeBtn)(AnswerQuestionCell* cell);
@end
