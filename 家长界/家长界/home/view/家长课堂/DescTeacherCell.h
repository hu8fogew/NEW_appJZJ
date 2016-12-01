//
//  DescTeacherCell.h
//  家长界
//
//  Created by mac on 2016/11/24.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescTeacherCell : UITableViewCell

/*老师头像*/
@property(nonatomic,strong)UIImageView *teacherHeaderImage;

/*老师名字*/
@property(nonatomic,strong)UILabel *descTeacherName;

/*老师研究方向*/
@property(nonatomic,strong)UILabel *descKind;

/*老师的详情介绍*/

@property(nonatomic,strong)UILabel *descDetialLabel;


@end
