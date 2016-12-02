//
//  QuestionDescCell.m
//  家长界
//
//  Created by mac on 2016/12/1.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QuestionDescCell.h"

@implementation QuestionDescCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        
        self.backgroundColor = HWColor(241, 241, 241);
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.53-1.5)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        //图标
        _quesImage = [[UIImageView alloc]initWithFrame:CGRectMake(marginLRWidth, 10, vi.height*0.15, vi.height*0.15)];
        _quesImage.layer.cornerRadius = (vi.height*0.15)/2;
        _quesImage.layer.masksToBounds = YES;
        [vi addSubview:_quesImage];
        //用户名
        _userNameText = [self createLabelWithFrame:CGRectMake(_quesImage.x+_quesImage.width+3, 10, 80, vi.height*0.15) andTextColor:HWColor(153, 153, 153) andTextSize:14 andSView:vi];
        //用户发布时间
        _timeText = [self createLabelWithFrame:CGRectMake(_userNameText.x+_userNameText.width, _userNameText.y, 80, _userNameText.height) andTextColor:HWColor(153, 153, 153) andTextSize:14 andSView:vi];
        //问题
        _questionText = [self createLabelWithFrame:CGRectMake(_quesImage.x, _userNameText.y+_userNameText.height, SCREEN_WIDTH-20, vi.height*0.16) andTextColor:HWColor(51, 51, 51) andTextSize:16 andSView:vi];
        
        //回答详解
        _descQuesText = [self createLabelWithFrame:CGRectMake(_questionText.x, _questionText.y+_questionText.height, _questionText.width, vi.height*0.4) andTextColor:HWColor(153, 153, 153) andTextSize:15 andSView:vi];
        
        _anserOfNum = [self createLabelWithFrame:CGRectMake(vi.width/2, _descQuesText.y+_descQuesText.height, vi.width/2-10, vi.height*0.15) andTextColor:HWColor(153, 153, 153) andTextSize:13 andSView:vi];
        _anserOfNum.textAlignment = NSTextAlignmentRight;
        
    }
    return self;
}


-(UILabel *)createLabelWithFrame:(CGRect)frame andTextColor:(UIColor*)tColor andTextSize:(CGFloat)size andSView:(UIView*)sv
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    
    [sv addSubview:lab];
    lab.font = [UIFont systemFontOfSize:size];
    lab.textColor = tColor;
    lab.backgroundColor = [UIColor whiteColor];
    
    
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
