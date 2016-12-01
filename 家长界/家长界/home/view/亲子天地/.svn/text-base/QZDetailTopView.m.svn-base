//
//  QZDetailTopView.m
//  家长界
//
//  Created by taylor on 2016/11/21.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QZDetailTopView.h"

@implementation QZDetailTopView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [self createLabelWithTextcolor:[UIColor blackColor] andTextfont:17 andText:@"哈童活动年卡隆重推出，优惠多多"];
        _timeLabel = [self createLabelWithTextcolor:[UIColor grayColor] andTextfont:14 andText:@"发布时间：2016-11-20"];
        _scanLabel = [self createLabelWithTextcolor:[UIColor grayColor] andTextfont:14 andText:@"浏览：302次"];
        
        _saveBtn = [self createBtnWithSetNorImage:@"shoucangnomal" andHighLightedImage:@"shoucangheigh" andTag:0];
        _shareBtn = [self createBtnWithSetNorImage:@"relaynomal" andHighLightedImage:@"relayheigh" andTag:1];
        
    }
    
    return self;
}


//添加label
-(UILabel *)createLabelWithTextcolor:(UIColor *)textcolor andTextfont:(CGFloat)font andText:(NSString *)text{
    UILabel *label = [UILabel new];
    label.textColor = textcolor;
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    [self addSubview:label];
    
    return label;
}

//添加button
-(UIButton *)createBtnWithSetNorImage:(NSString *)norImage andHighLightedImage:(NSString *)hlImage andTag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hlImage] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    
    [self addSubview:button];
    return button;
    
}

-(void)clickBtn:(UIButton *)sender{

    if (sender.tag == 0) {
        HWLog(@"收藏");
    }
    if (sender.tag == 1) {
        
        HWLog(@"分享");
    }
}

@end
