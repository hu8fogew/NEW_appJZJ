//
//  ParentDetailTopView.m
//  家长界
//
//  Created by mac on 2016/11/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentDetailTopView.h"

@implementation ParentDetailTopView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //主标题
        _PmainText = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:[UIColor blackColor] andTextFont:20 andText:@"幼儿原创英语儿歌英文童谣"];
        
        
        //讲师Label
        
        _PteacherName = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:HWColor(164, 164, 164) andTextFont:15 andText:@"讲师：李翠芝"];
        
        //观看人次
        _PcountOfhuman = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:HWColor(164, 164, 164) andTextFont:15 andText:@"观看人次：3万"];
        
        //日期
        _PdateLableText = [self createLableWithAlignment:NSTextAlignmentLeft andTextColor:HWColor(164, 164, 164) andTextFont:15 andText:@"2016-10-13 20:00"];
        
        //收藏按钮
        _PcollectButton = [self btncreateButtonSetNormalImage:@"shoucangnomal" andHightLightedImage:@"shoucangheigh" andTag:0];
        
        //转发按钮
        _PrelayButton = [self btncreateButtonSetNormalImage:@"relaynomal" andHightLightedImage:@"relayHeigh" andTag:1];
        
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

//添加按钮
-(UIButton *)btncreateButtonSetNormalImage:(NSString *)nolImag andHightLightedImage:(NSString *)hImage andTag:(NSInteger)tage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundImage:[UIImage imageNamed:nolImag] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hImage] forState:UIControlStateHighlighted];
    btn.tag = tage;
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    
    return btn;
}

-(void)clickBtn:(UIButton *)sender
{
    if (sender.tag == 0) {
        
        HWLog(@"收藏");
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shoucang" object:nil userInfo:nil];
        [sender setBackgroundImage:[UIImage imageNamed:@"shoucangheigh"] forState:UIControlStateNormal];
        
    }
    
    if (sender.tag == 1) {
     
        HWLog(@"转发");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"relay" object:nil userInfo:nil];
        
    }
}


@end
