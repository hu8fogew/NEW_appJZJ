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
@end
