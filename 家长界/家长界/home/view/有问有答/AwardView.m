//
//  AwardView.m
//  家长界
//
//  Created by mac on 2016/12/7.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AwardView.h"

@interface AwardView()<UITextViewDelegate>
@property(nonatomic,strong)UIView *backGroundView;
@end

@implementation AwardView


-(instancetype)initWithFrame:(CGRect)frame andSuperView:(UIView *)sView
{
    
    self = [super initWithFrame: frame];
    if (self) {
        
        [self addBackgroundView:sView];
        [sView addSubview:self];
        self.backgroundColor = [UIColor whiteColor];
        self.awardText = [[PlaceholderTextView alloc]init];
        
        self.awardText.delegate = self;
        self.awardText.placeholder = @"10";
//        self.awardText.backgroundColor = HWColor(242, 242, 242);
        self.awardText.font = [UIFont systemFontOfSize:17];
        self.awardText.textColor = [UIColor blackColor];
        self.awardText.textAlignment = NSTextAlignmentLeft;
        self.awardText.editable = YES;
//        self.awardText.placeholderColor = HWColor(100, 100, 100);
        self.awardText.layer.cornerRadius = 6;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn addTarget:self action:@selector(awardClick) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = HWColor(102, 156, 222);
        btn.layer.cornerRadius = 4;
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitle:@"打赏" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.awardBtn = btn;
        
        [self addSubview:self.awardText];
        [self addSubview:self.awardBtn];
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
-(void)awardClick
{
    
    if([self.awardText.text isEqualToString:@""])
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
