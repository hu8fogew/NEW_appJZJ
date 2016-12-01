//
//  TeacherOfDescCell.h
//  家长界
//
//  Created by mac on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherOfDescCell : UITableViewCell
//老师名字
@property(nonatomic,strong)UILabel *teacherName;
//老师的教育类型
@property(nonatomic,strong)UILabel *teachKind;
//咨询人数
@property(nonatomic,strong)UILabel *requireNum;
@property(nonatomic,strong)UILabel *peopleText;

//老师的图片背景
@property(nonatomic,strong)UIImageView *teacherBackImage;

//老师的座右铭
@property(nonatomic,strong)UILabel *mottoText;

//定位小图标
@property(nonatomic,strong)UIImageView *mapImage;

//地理位置
@property(nonatomic,strong)UILabel *areaText;



@end
