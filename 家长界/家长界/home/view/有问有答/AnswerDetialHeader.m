//
//  AnswerDetialHeader.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerDetialHeader.h"
#import "LWTextParser.h"
#import "LWAsyncDisplayView.h"
@interface AnswerDetialHeader()<LWAsyncDisplayViewDelegate>
@property(nonatomic,strong)LWAsyncDisplayView *asyncView;
@property(nonatomic,strong)UIView *vF;
@property(nonatomic,strong)UIView *vS;
@end
@implementation AnswerDetialHeader

-(LWAsyncDisplayView *)asyncView
{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.delegate = self;
    }
    return _asyncView;
}
-(DetialQuestionLayout *)quetionLayout
{
    if (!_quetionLayout) {
        _quetionLayout = [[DetialQuestionLayout alloc]initAnswerQuestion];
        self.asyncView.layout = _quetionLayout;
    }
    return _quetionLayout;
}


-(UIView *)vF
{
    if (!_vF) {
        _vF = [UIView new];
        _vF.backgroundColor = HWColor(153, 153, 153);
        
    }
    return _vF;
}

-(UIView *)vS
{
    if (!_vS) {
        _vS = [UIView new];
        _vS.backgroundColor = HWColor(153, 153, 153);
        
    }
    return _vS;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.asyncView];
        
        
        [self addSubview:self.vF];
        
        
        [self addSubview:self.vS];
        
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.quetionLayout.headerHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
    
    
}

- (void)_layouSubViews {
    self.vF.frame = self.quetionLayout.lineF;
    self.vS.frame = self.quetionLayout.lineS;
}



@end
