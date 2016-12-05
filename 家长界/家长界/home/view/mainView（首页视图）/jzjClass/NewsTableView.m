//
//  NewsTableView.m
//  家长界
//
//  Created by mac on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "NewsTableView.h"
@interface NewsTableView()
//点
@property(nonatomic,strong)UIImageView*img;

//主标题
@property(nonatomic,strong)UILabel *mainlabText;
//副标题
@property(nonatomic,strong)UILabel *secondText;
//评论
@property(nonatomic,strong)UILabel *commentText;

@end
@implementation NewsTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame: frame];
    if (self) {
        self.width = SCREEN_WIDTH*4/5;
        self.height = SCREEN_WIDTH/6;
//        self.backgroundColor = HWRandomColor;
        [self createView];
        
    }
    
    
    return self;
}

//创建视图
-(void)createView
{
    
//    UIView *vi = [[UIView alloc]initWithFrame:self.bounds];
//    vi.backgroundColor = [UIColor redColor];
////    self.animationVi = vi;
//    [self addSubview:vi];
    
    _img = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/30, self.height/6, self.width/30, self.width/30)];
    _img.image = [UIImage imageNamed:@"dian_image"];
    _img.layer.cornerRadius = self.width/60;
    _img.layer.masksToBounds = YES;
    [self addSubview:_img];
    
    //主标题
    _mainlabText = [[UILabel alloc]initWithFrame:CGRectMake(self.width/10+5, 0, self.width*2/3, self.height/2)];
    _mainlabText.textColor = HWColor(53, 53, 53);
    _mainlabText.font = [UIFont systemFontOfSize:18];
    _mainlabText.textAlignment = NSTextAlignmentLeft;
    _mainlabText.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mainlabText];
    
    //副标题
    _secondText = [[UILabel alloc]initWithFrame:CGRectMake(_mainlabText.x, _mainlabText.y+_mainlabText.height, _mainlabText.width, self.height/2)];
    _secondText.font = [UIFont systemFontOfSize:14];
    _secondText.textColor = HWColor(153, 153, 153);
    _secondText.textAlignment = NSTextAlignmentLeft;
    _secondText.backgroundColor = [UIColor whiteColor];
    [self addSubview:_secondText];
    
    UIView *vo = [[UIView alloc]initWithFrame:CGRectMake(_secondText.x+_secondText.width, 10, 2, self.height-20)];
    vo.backgroundColor = HWColor(241, 241, 241);
    [self addSubview:vo];
    //评论
    _commentText = [[UILabel alloc]initWithFrame:CGRectMake(_mainlabText.x+_mainlabText.width+1.5, self.height/4, self.width-(_mainlabText.x+_mainlabText.width+15.5), self.height/2)];
    _commentText.font = [UIFont systemFontOfSize:15];
    _commentText.textColor = HWColor(153, 153, 153);
    _commentText.textAlignment = NSTextAlignmentRight;
    _commentText.backgroundColor = [UIColor whiteColor];
    [self addSubview:_commentText];
    
    
    
    
}



//跟新数据
-(void)setViewWithMainQues:(NSString *)quesText andSecondText:(NSString *)sText andCommentText:(NSString *)numText
{
    
    self.mainlabText.text = quesText;
    self.secondText.text = sText;
    self.commentText.text = numText;
    
    
}





@end
