//
//  teacherHeaderView.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherHeaderView.h"
#import "LWAsyncDisplayView.h"
@interface TeacherHeaderView()<LWAsyncDisplayViewDelegate>


@property(nonatomic,strong)LWAsyncDisplayView *asyncView;

@end

@implementation TeacherHeaderView

-(LWAsyncDisplayView *)asyncView
{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.delegate = self;
    }
    return _asyncView;
}
-(TeachDescLayout *)descViewLayout
{
    if (!_descViewLayout) {
        _descViewLayout = [[TeachDescLayout alloc]initDescTeacherView];
        self.asyncView.layout = _descViewLayout;
    }
    return _descViewLayout;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.asyncView];
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.descViewLayout.descViewHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
    
    
}

- (void)_layouSubViews {


}



@end
