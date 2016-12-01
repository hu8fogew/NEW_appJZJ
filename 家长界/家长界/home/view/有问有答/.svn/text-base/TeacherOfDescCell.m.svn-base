//
//  TeacherOfDescCell.m
//  家长界
//
//  Created by mac on 2016/11/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherOfDescCell.h"

@implementation TeacherOfDescCell


-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HWColor(241, 241, 241);
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.55-1.5)];
        backView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:backView];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(10, SCREEN_WIDTH*0.06, SCREEN_WIDTH-20, SCREEN_WIDTH*0.42)];
//        vi.backgroundColor = [UIColor greenColor];
        [backView addSubview:vi];
        
        //老师名称
        _teacherName = [self createLabelWithSize:16 andTextColor:HWColor(51, 51, 51) andAlpha:1 andSuperView:vi andTextAligment:NSTextAlignmentLeft andFrame:CGRectMake(0, 0, 50, vi.height*0.18)];
        _teachKind = [self createLabelWithSize:14 andTextColor:HWColor(151, 151, 151) andAlpha:1 andSuperView:vi andTextAligment:NSTextAlignmentLeft andFrame:CGRectMake(_teacherName.x+_teacherName.width, 0, SCREEN_WIDTH*2/5, _teacherName.height)];
        
        _requireNum = [self createLabelWithSize:13 andTextColor:HWColor(215, 137, 60) andAlpha:1 andSuperView:vi andTextAligment:NSTextAlignmentRight andFrame:CGRectMake(SCREEN_WIDTH*3/4, 0, SCREEN_WIDTH/14, _teacherName.height)];
        _peopleText = [self createLabelWithSize:14 andTextColor:HWColor(153, 153, 153) andAlpha:1 andSuperView:vi andTextAligment:NSTextAlignmentLeft andFrame:CGRectMake(_requireNum.x+_requireNum.width, 0, SCREEN_WIDTH-(_requireNum.x+_requireNum.width+10), _teacherName.height)];
        _teacherBackImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, _teacherName.y+_teacherName.height, vi.width, vi.height*0.82)];
        [vi addSubview:_teacherBackImage];
        
        _mottoText = [self createLabelWithSize:14 andTextColor:[UIColor whiteColor] andAlpha:1 andSuperView:vi andTextAligment:NSTextAlignmentLeft andFrame:CGRectMake(0, vi.height-_teacherName.height, vi.width*2/3, _teacherName.height)];
        
        
        
        _areaText = [self createLabelWithSize:14 andTextColor:[UIColor whiteColor] andAlpha:1 andSuperView:vi andTextAligment:NSTextAlignmentLeft andFrame:CGRectMake(vi.width-40, _mottoText.y, 40, _mottoText.height)];
        _mapImage = [[UIImageView alloc]initWithFrame:CGRectMake(_areaText.x-_areaText.height*2/3, _areaText.y+_areaText.height/4, _areaText.height/2, _areaText.height/2)];
        
        [vi addSubview:_mapImage];
        
    }
    return self;
}



-(UILabel *)createLabelWithSize:(CGFloat)textSize andTextColor:(UIColor *)color andAlpha:(CGFloat)alpha andSuperView:(UIView *)sv andTextAligment:(NSTextAlignment)textAligment andFrame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
//    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:16],};
//    CGSize textSizeWidth = [lab.text boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
//    lab.width = textSizeWidth.width;
    lab.font = [UIFont systemFontOfSize:textSize];
    lab.textColor = color;
    lab.alpha = alpha;
    lab.textAlignment = textAligment;
    [sv addSubview:lab];
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
