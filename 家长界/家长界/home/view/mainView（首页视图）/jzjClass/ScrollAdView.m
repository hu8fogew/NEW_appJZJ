//
//  ScrollAdView.m
//  家长界
//
//  Created by mac on 2016/12/2.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ScrollAdView.h"

@interface ScrollAdView()<CAAnimationDelegate>
@property(nonatomic,strong)NewsTableView *tableV;

@property(nonatomic,strong)NSArray *upDownArr;


@end


@implementation ScrollAdView
static int countInt = 0;
static NSString *notice_index;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if(self)
    {
        
        [self loadAdView];
        
    }
    return self;
}

-(void)loadAdView
{
    
    self.backgroundColor = [UIColor whiteColor];
    self.tableV = [[NewsTableView alloc]initWithFrame:self.bounds];
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(topNewsInfoClick:)];
    self.tableV.userInteractionEnabled = YES;
    [self.tableV addGestureRecognizer:tapGest];
    [self addSubview:self.tableV];
    
    
}

#pragma mark /******* 点击条目的动作*******/

-(void)topNewsInfoClick:(id)sender
{
    HWLog(@"点击了%zd",countInt);
}

-(void)setViewWithUpDownArr:(NSArray *)arr
{
    self.upDownArr = arr;
    [self setUpDownView];
}



#pragma mark 实现上下翻滚
-(void)setUpDownView
{
    notice_index = [self.upDownArr objectAtIndex:0];
    [self.tableV setViewWithMainQues:@"孩子不好好吃饭怎么办？" andSecondText:@"好好上学，天天向上" andCommentText:@"0评论"];
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.tableV.alpha = 0;
        [self.tableV exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        self.tableV.alpha = 1;
    } completion:^(BOOL finished) {
        //设定定时器
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(displayNewsView) userInfo:nil repeats:YES];
    }];
    
    
}

-(void)displayNewsView
{
    countInt++;
    if (countInt >= [self.upDownArr count]) {
        countInt=0;
        
        
        
        
        
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = 1.0f;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.fillMode = kCAFillModeBackwards;
        animation.removedOnCompletion = YES;
        animation.subtype = @"fromTop";
        animation.type = @"push";
        
        notice_index = [self.upDownArr objectAtIndex:countInt];

        [self.tableV.layer addAnimation:animation forKey:@"animationoID"];
        
        [self.tableV setViewWithMainQues:@"你好哈哈哈" andSecondText:@"hhuiadeuiwcbeui" andCommentText:@"10评"];
        
    }
    
}




@end
