//
//  AnswerDetialHeader.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerDetialHeader.h"

@implementation AnswerDetialHeader

static const int sizeOflabelF = 15;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageWH = [[UIImageView alloc]init];
        
        self.imageWH.layer.cornerRadius = self.imageWH.height/2;
        self.imageWH.layer.masksToBounds = YES;
        self.imageWH.image = [UIImage imageNamed:@"WH"];
        self.questionLabel = [self addLabelWithTextColor:[UIColor blackColor] andTextSize:20 andTextAlignment:NSTextAlignmentLeft];
        self.questionLabel.text = @"如何做出生命最重要的决定？";
        self.numberOfAnswer = [self addLabelWithTextColor:HWColor(152, 152, 152) andTextSize:17 andTextAlignment:NSTextAlignmentLeft];
        self.numberOfAnswer.text = @"4个回答";
        self.labelF = [self addLabelWithTextColor:HWColor(152, 152, 152) andTextSize:sizeOflabelF andTextAlignment:NSTextAlignmentCenter];
        self.labelF.text = @"企聘通网友";
        self.labelS = [self addLabelWithTextColor:HWColor(152, 152, 152) andTextSize:sizeOflabelF andTextAlignment:NSTextAlignmentCenter];
        self.labelS.text =@"浏览29次";
        self.labelT = [self addLabelWithTextColor:HWColor(152, 152, 152) andTextSize:sizeOflabelF andTextAlignment:NSTextAlignmentLeft];
        self.labelT.text = @"  2016-10-21  11:57";
        self.discQuestion = [self addLabelWithTextColor:HWColor(114, 114, 114) andTextSize:sizeOflabelF andTextAlignment:NSTextAlignmentLeft];
        self.discQuestion.numberOfLines = 0;
        
        NSString *str = @"问题描述：孩子一碰到不顺心的事就喜欢跺脚，又哭又闹丢东西倒在地上不起来是不是有自虐倾向，对于孩子来说发脾气是孩子成长过程中是自我意识";
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
        NSMutableParagraphStyle *paragraphSytle = [[NSMutableParagraphStyle alloc]init];
        [paragraphSytle setLineSpacing:8];
        [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphSytle range:NSMakeRange(0, [str length])];
        [self.discQuestion setAttributedText:attributedStr];
        [self.discQuestion sizeToFit];
        
        [self addSubview:self.imageWH];
        [self addSubview:self.questionLabel];
        [self addSubview:self.numberOfAnswer];
        [self addSubview:self.labelF];
        [self addSubview:self.labelS];
        [self addSubview:self.labelT];
        [self addSubview:self.discQuestion];
    }
    return self;
}


-(UILabel *)addLabelWithTextColor:(UIColor *)color andTextSize:(CGFloat)size andTextAlignment:(NSTextAlignment)align
{
    UILabel *lab = [[UILabel alloc]init];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:size];
    lab.textAlignment = align;
    [self addSubview:lab];
    
    return lab;
}


@end
