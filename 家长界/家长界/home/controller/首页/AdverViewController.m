//
//  AdverViewController.m
//  家长界
//
//  Created by mac on 2016/11/18.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AdverViewController.h"

@interface AdverViewController ()<UITextViewDelegate>

/*textView*/
@property(nonatomic,strong)UITextView *textView;

/*评论、点赞、转发的视图*/
@property(nonatomic,strong)UIView *bottomView;

@end
@implementation AdverViewController
static const int bottomViewHeight = 50;

#pragma mark /**********懒加载************/

/*textView*/
-(UITextView *)textView
{
    
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-bottomViewHeight)];
        _textView.delegate = self;
    }
    return _textView;
    
}

/*底部视图的初始化*/

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-bottomViewHeight, SCREEN_WIDTH, bottomViewHeight)];
        
        _bottomView.backgroundColor = [UIColor yellowColor];
    }
    
    return _bottomView;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self creatView];
}

/*加载视图*/
-(void)creatView
{
    
    [self.view addSubview:self.textView];
    
    [self.view addSubview:self.bottomView];
    
    
}


/*添加底部的三大功能*/

-(void)createActionBtn
{
    
    
}



#pragma mark textViewDelegate代理方法








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
