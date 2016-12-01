//
//  RMJZTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "RMJZTableViewCell.h"

@implementation RMJZTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //个人详情视图
        self.backgroundColor = HWColor(241, 241, 241);
        UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, qptJZcellHeight)];
        topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:topView];
        
        //左边图标
        _hMainImage = [self addImageViewWithFrame:CGRectMake(10, topView.height*0.2, topView.height*0.67-2, topView.height*0.67-2) andSview:topView];
        _hMainImage.layer.borderWidth = 1.5;
        _hMainImage.layer.borderColor = [HWColor(241, 241, 241) CGColor];
        _hMainImage.layer.cornerRadius = 2;
        _hMainImage.layer.masksToBounds = YES;
        
        
        //职位类型
        _zwKindText = [self addLabelWithFrame:CGRectMake(_hMainImage.x+_hMainImage.width+10, _hMainImage.y, topView.width/3, _hMainImage.height/4) andTextColor:HWColor(51, 51, 51) andTextSize:17 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //薪资
        _salaryText = [self addLabelWithFrame:CGRectMake(topView.width*2/3, _zwKindText.y, topView.width/3-50, _zwKindText.height) andTextColor:HWColor(255, 152, 23) andTextSize:15 andTextAlignment:NSTextAlignmentRight andsView:topView];
        
        _payOfwaytext = [[UILabel alloc]initWithFrame:CGRectMake(_salaryText.x+_salaryText.width, _salaryText.y+_salaryText.height/10, 40, _salaryText.height*4/5)];
        _payOfwaytext.font = [UIFont systemFontOfSize:14];
        _payOfwaytext.textColor = HWColor(31, 199, 193);
        _payOfwaytext.textAlignment = NSTextAlignmentCenter;
        _payOfwaytext.layer.borderColor =[HWColor(31, 199, 193) CGColor];
        _payOfwaytext.layer.borderWidth = 1;
        _payOfwaytext.layer.cornerRadius = 3;
        _payOfwaytext.layer.masksToBounds = YES;
        
        [topView addSubview:_payOfwaytext];
        
        //公司
        _companyText = [self addLabelWithFrame:CGRectMake(_zwKindText.x, _zwKindText.y+_zwKindText.height, SCREEN_WIDTH*2/7, _zwKindText.height) andTextColor:HWColor(102, 102, 102) andTextSize:14 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //vip
        _vipImage = [self addImageViewWithFrame:CGRectMake(_companyText.x+_companyText.width, _companyText.y+_companyText.height*1/6, _companyText.height*2/3, _companyText.height*2/3) andSview:topView];
        //行业类型
        _hyText = [self addLabelWithFrame:CGRectMake(_vipImage.x+_vipImage.width+5, _vipImage.y, topView.width/9, _vipImage.height) andTextColor:HWColor(153, 153, 153) andTextSize:14 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(_hyText.x+_hyText.width, _hyText.y+_hyText.height/10, 1, _hyText.height*4/5)];
        line.backgroundColor = HWColor(153, 153, 153);
        [topView addSubview:line];
        
        //是否上市
        _bigCompanyText = [self addLabelWithFrame:CGRectMake(line.x+line.width, _hyText.y, topView.width/8, _hyText.height) andTextColor:HWColor(153, 153, 153) andTextSize:14 andTextAlignment:NSTextAlignmentCenter andsView:topView];
        //学历照片
        _academicImage = [self addImageViewWithFrame:CGRectMake(_zwKindText.x, _companyText.y+_companyText.height +_hMainImage.height/24, _hMainImage.height/6, _hMainImage.height/6) andSview:topView];
        //学历
        _academicText = [self addLabelWithFrame:CGRectMake(_academicImage.x+_academicImage.width+2, _companyText.y+_companyText.height, topView.width/6, _companyText.height) andTextColor:HWColor(153, 153, 153) andTextSize:14 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        
        //时间图片
        _timeImageView = [self addImageViewWithFrame:CGRectMake(_academicText.x+_academicText.width+10, _academicImage.y, _academicImage.width, _academicImage.height) andSview:topView];
        //工作年限
        _timeText = [self addLabelWithFrame:CGRectMake(_timeImageView.x+_timeImageView.width+2, _academicText.y, topView.width/5, _academicText.height) andTextColor:HWColor(153, 153, 153) andTextSize:14 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //地图图标
        _mapImageView = [self addImageViewWithFrame:CGRectMake(_academicImage.x, _academicText.y+_academicText.height+_academicImage.height/6, _academicImage.width, _academicImage.height) andSview:topView];
        //地理位置
        _earaText = [self addLabelWithFrame:CGRectMake(_mapImageView.x+_mapImageView.width+2, _academicText.y+_academicText.height, topView.width*3/7, _academicText.height) andTextColor:HWColor(153, 153, 153) andTextSize:14 andTextAlignment:NSTextAlignmentLeft andsView:topView];
       
        //查看人数
        _numText = [self addLabelWithFrame:CGRectMake(SCREEN_WIDTH-50-10, _earaText.y, 50, _earaText.height) andTextColor:HWColor(153, 153, 153) andTextSize:15 andTextAlignment:NSTextAlignmentRight andsView:topView];
        //查看人图标
        _eyeImage = [self addImageViewWithFrame:CGRectMake(_numText.x-_mapImageView.width+5, _mapImageView.y+4, _mapImageView.width+5, _mapImageView.height-4) andSview:topView];
        
    }
    return self;
}


-(UIImageView *)addImageViewWithFrame:(CGRect)frame andSview:(UIView*)sv
{
    UIImageView *image = [[UIImageView alloc]initWithFrame:frame];
    [sv addSubview:image];
    return image;
}


-(UILabel *)addLabelWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextSize:(CGFloat)size andTextAlignment:(NSTextAlignment)align andsView:(UIView *)sview
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:size];
    lab.textAlignment = align;
    [sview addSubview:lab];
    
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
