//
//  AnswerQuestion.m
//  家长界
//
//  Created by mac on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerQuestion.h"

@interface AnswerQuestion()<UITextViewDelegate>
@property(nonatomic,strong)UIView *backGroundView;
@end

@implementation AnswerQuestion


-(instancetype)initWithFrame:(CGRect)frame andSuperView:(UIView *)sView
{
    
    self = [super initWithFrame: frame];
    if (self) {
     
        [self addBackgroundView:sView];
        [sView addSubview:self];
        self.backgroundColor = [UIColor whiteColor];
        self.answerText = [[PlaceholderTextView alloc]init];
        
        self.answerText.delegate = self;
        self.answerText.placeholder = @"编辑内容";
        self.answerText.backgroundColor = HWColor(242, 242, 242);
        self.answerText.font = [UIFont systemFontOfSize:17];
        self.answerText.textColor = [UIColor blackColor];
        self.answerText.textAlignment = NSTextAlignmentLeft;
        self.answerText.editable = YES;
        self.answerText.placeholderColor = HWColor(100, 100, 100);
        self.answerText.layer.cornerRadius = 6;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = HWColor(102, 156, 222);
        btn.layer.cornerRadius = 4;
        
        [btn setTitle:@"提交" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.commitBtn = btn;
        
        [self addSubview:self.answerText];
        [self addSubview:self.commitBtn];
    }
    return self;
}


/*添加父视图*/
-(void)addBackgroundView:(UIView *)superView
{
    _backGroundView = [[UIView alloc]initWithFrame:superView.bounds];
    _backGroundView.backgroundColor = [UIColor blackColor];
    _backGroundView.alpha = 0.4;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleBtnAction)];
    [_backGroundView addGestureRecognizer:tap];
    [superView addSubview:_backGroundView];
}

-(void)cancleBtnAction
{
    [_backGroundView removeFromSuperview];
    _backGroundView = nil;
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect sf = self.frame;
        sf.origin.y = SCREEN_HEIGHT;
        self.frame = sf;
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}




/*提交内容*/
-(void)commitClick
{
    
    if([self.answerText.text isEqualToString:@""])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"textFornil" object:nil userInfo:nil];
    }else
    {
    
    HWLog(@"提交");
    [self cancleBtnAction];
    }
}

-(void)textViewDidChange:(UITextView *)textView
{
    
    
    
    
}


@end
