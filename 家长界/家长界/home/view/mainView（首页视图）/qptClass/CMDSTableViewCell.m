//
//  CMDSTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CMDSTableViewCell.h"

@implementation CMDSTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //个人详情视图
        self.backgroundColor = HWColor(241, 241, 241);
        UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, qptZWcellHeight*0.7)];
        topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:topView];
        
        //左边图标
        _hMainImage = [self addImageViewWithFrame:CGRectMake(10, topView.height*0.2, topView.height*0.67-2, topView.height*0.67-2) andSview:topView];
        
        
        // 人名
        _zwNameText = [self addLabelWithFrame:CGRectMake(_hMainImage.x+_hMainImage.width+10, _hMainImage.y, _hMainImage.width*2/3, _hMainImage.height/4) andTextColor:HWColor(51, 51, 51) andTextSize:18 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //薪资
        _salaryText = [self addLabelWithFrame:CGRectMake(topView.width*7/8, _zwNameText.y, topView.width/8-10, _zwNameText.height) andTextColor:HWColor(255, 152, 23) andTextSize:18 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        
        //工作职位名称
        _zwKindText = [self addLabelWithFrame:CGRectMake(_zwNameText.x, _zwNameText.y+_zwNameText.height, SCREEN_WIDTH*2/7, _zwNameText.height) andTextColor:HWColor(61, 158, 226) andTextSize:15 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //vip
        _vipImage = [self addImageViewWithFrame:CGRectMake(_zwNameText.x+_zwNameText.width, _zwNameText.y+_zwNameText.height/6, _zwNameText.height*2/3, _zwNameText.height*2/3) andSview:topView];
    
        //学历照片
        _academicImage = [self addImageViewWithFrame:CGRectMake(_zwKindText.x, _zwKindText.y+_zwKindText.height +_hMainImage.height/24, _hMainImage.height/6, _hMainImage.height/6) andSview:topView];
        //学历
        _academicText = [self addLabelWithFrame:CGRectMake(_academicImage.x+_academicImage.width+2, _zwKindText.y+_zwKindText.height, topView.width/11, _zwKindText.height) andTextColor:HWColor(153, 153, 153) andTextSize:15 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        
        //时间图片
        _timeImageView = [self addImageViewWithFrame:CGRectMake(_academicText.x+_academicText.width+10, _academicImage.y, _academicImage.width, _academicImage.height) andSview:topView];
        //工作年限
        _timeText = [self addLabelWithFrame:CGRectMake(_timeImageView.x+_timeImageView.width+2, _academicText.y, topView.width/5, _academicText.height) andTextColor:HWColor(153, 153, 153) andTextSize:15 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //地图图标
        _mapImageView = [self addImageViewWithFrame:CGRectMake(_academicImage.x, _academicText.y+_academicText.height+_academicImage.height/6, _academicImage.width, _academicImage.height) andSview:topView];
        //地理位置
        _earaText = [self addLabelWithFrame:CGRectMake(_mapImageView.x+_mapImageView.width+2, _academicText.y+_academicText.height, topView.width*3/7, _academicText.height) andTextColor:HWColor(153, 153, 153) andTextSize:15 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        //查看人图标
        _eyeImage = [self addImageViewWithFrame:CGRectMake(_salaryText.x-_academicImage.width-7, _mapImageView.y+4, _mapImageView.width+5, _mapImageView.height-4) andSview:topView];
        //查看人数
        _numText = [self addLabelWithFrame:CGRectMake(_salaryText.x, _earaText.y, _salaryText.width, _earaText.height) andTextColor:HWColor(153, 153, 153) andTextSize:16 andTextAlignment:NSTextAlignmentLeft andsView:topView];
        
        
        //底部视图（公司的实力种类）
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.y+topView.height+1.5, SCREEN_WIDTH, qptZWcellHeight-topView.height-topView.y-1.5)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_bottomView];
        
        
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
