//
//  TeacherTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/21.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherTableViewCell : UITableViewCell

/*课程推荐的cellimage*/
@property(nonatomic,strong)UIImageView *teacherImage;
/*主标题*/
@property(nonatomic,strong)UILabel *mainTeacherLabel;

/*副标题*/
@property(nonatomic,strong)UILabel *wdLabel;
/*询问人次的Label*/

@property(nonatomic,strong)UILabel *numberOfRequire;

/*教育类型*/
@property(nonatomic,strong)UIView *teachKindView;

@property(nonatomic,strong)UILabel *teachOfKindLabel;

-(instancetype)initWithFrame:(CGRect)frame;

@end
