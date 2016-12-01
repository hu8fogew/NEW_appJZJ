//
//  TextQuestionView.m
//  家长界
//
//  Created by mac on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TextQuestionView.h"

@interface TextQuestionView()<UITextViewDelegate>



@end

@implementation TextQuestionView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UILabel *lab = [[UILabel alloc]init];
        lab.font = [UIFont systemFontOfSize:18];
        lab.text = @"标题";
        lab.textColor = [UIColor blackColor];
        lab.backgroundColor = [UIColor whiteColor];
        lab.textAlignment = NSTextAlignmentRight;
        self.lab = lab;
        self.textMain = [[PlaceholderTextView alloc]init];
        
        self.textMain.backgroundColor = [UIColor whiteColor];
        self.textMain.delegate = self;
        self.textMain.font = [UIFont systemFontOfSize:15];
        
        self.textMain.textColor = [UIColor blackColor];
        self.textMain.textAlignment = NSTextAlignmentLeft;
        self.textMain.editable = YES;
        self.textMain.placeholderColor = HWColor(100, 100, 100);
        self.textMain.placeholder = @"让大家快速了解你的问题（18个以内）";
        
        
        [self addSubview:self.textMain];
        [self addSubview:lab];
    }
    return self;
}



#pragma mark 计算textDetail的输入字符长度
-(void)textViewDidChange:(UITextView *)textView
{
    [self wordLimit:textView];
    
}

-(BOOL)wordLimit:(UITextView *)text
{
    if (text.text.length < 18) {
        HWLog(@"%ld",text.text.length);
        self.textMain.editable = YES;
    }else
    {
        self.textMain.editable = NO;
    }
    return nil;
}

@end
