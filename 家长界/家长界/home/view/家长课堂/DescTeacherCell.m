//
//  DescTeacherCell.m
//  家长界
//
//  Created by mac on 2016/11/24.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "DescTeacherCell.h"

@implementation DescTeacherCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        /*老师头像*/
        _teacherHeaderImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH/8, SCREEN_WIDTH/8)];
        _teacherHeaderImage.layer.cornerRadius = SCREEN_WIDTH/18;
        _teacherHeaderImage.layer.masksToBounds = YES;
        [self addSubview:_teacherHeaderImage];
        /*老师名称*/
        
        _descTeacherName = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:[UIColor blackColor] andTextFont:20 andText:@"张宇杰"];
        
        _descTeacherName.frame = CGRectMake(self.teacherHeaderImage.x+self.teacherHeaderImage.width+5, self.teacherHeaderImage.y, SCREEN_WIDTH/4, self.teacherHeaderImage.height/2);
        
        /*描述老师研究方向*/
        _descKind = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:HWColor(146, 146, 146) andTextFont:16 andText:@"资深心理咨询师"];
        _descKind.frame = CGRectMake(self.descTeacherName.x, self.descTeacherName.y+self.descTeacherName.height, SCREEN_WIDTH/2, self.descTeacherName.height);
        
        /*老师的详细介绍*/
        _descDetialLabel = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:HWColor(146, 146, 146) andTextFont:16 andText:@""];
        
        _descDetialLabel.frame = CGRectMake(self.descKind.x, self.descKind.y+self.descKind.height, SCREEN_WIDTH-self.descKind.x-10, 80);
        _descDetialLabel.numberOfLines = 0;
        
        
        
    }
    return self;
}


//添加label
-(UILabel *)createLableWithAlignment:(NSTextAlignment)alignment andTextColor:(UIColor *)color andTextFont:(CGFloat)font andText:(NSString *)text
{
    UILabel *lab = [[UILabel alloc]init];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:font];
    lab.text = text;
    [self addSubview:lab];
    return lab;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
