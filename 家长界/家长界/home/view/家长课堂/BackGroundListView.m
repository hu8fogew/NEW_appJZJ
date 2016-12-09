//
//  BackGroundListView.m
//  家长界
//
//  Created by mac on 2016/12/9.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "BackGroundListView.h"

@interface BackGroundListView()

@end

@implementation BackGroundListView

-(instancetype)initWithFrame:(CGRect)frame andSPView:(UIView *)Sv
{
    
    self = [super initWithFrame: frame];
    if (self) {
        
        [self addBackgroundView:Sv];
        [Sv addSubview:self];
        
        _Ftable = [[ParentFirstTable alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-20)/3, SCREEN_HEIGHT/3)];
        _Ftable.backgroundColor = [UIColor whiteColor];
        [self addSubview:_Ftable];
        
        _Stable = [[ParentSecondTable alloc]initWithFrame:CGRectMake(0+(SCREEN_WIDTH-20)/3, 0, (SCREEN_WIDTH-20)/3, SCREEN_HEIGHT/3)];
        _Stable.backgroundColor = [UIColor whiteColor];
        [self addSubview:_Stable];
        
        
    }
    return self;
}

/*添加父视图*/
-(void)addBackgroundView:(UIView *)superView
{
    _backGroundView = [[UIView alloc]init];
    _backGroundView.backgroundColor = [UIColor blackColor];
    _backGroundView.alpha = 0.4;
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleBtnAction)];
//    [_backGroundView addGestureRecognizer:tap];
    [superView addSubview:_backGroundView];
}

-(void)cancleBtnAction
{
    [_backGroundView removeFromSuperview];
    _backGroundView = nil;
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect sf = self.frame;
        sf.origin.y = siftHeight;
        self.frame = sf;
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}





@end
