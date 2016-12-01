//
//  teacherHeaderView.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "teacherHeaderView.h"
@implementation teacherHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 420)];
        vi.backgroundColor = HWColor(242, 242, 242);
        [self addSubview:vi];
        
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, 100)];
        view1.backgroundColor = [UIColor whiteColor];
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:14.5];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textColor = [UIColor grayColor];
        [view1 addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view1).insets(UIEdgeInsetsMake(10, 15, 10, 10));
        }];
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, view1.y+view1.height+7.5, SCREEN_WIDTH, 80)];
        view2.backgroundColor = [UIColor whiteColor];
        self.levelLabel = [UILabel new];
        self.levelLabel.font = [UIFont systemFontOfSize:18];
        self.levelLabel.textColor = [UIColor blackColor];
        self.levelLabel.text = @"从业资质";
        self.levelDetailLabel = [UILabel new];
        self.levelDetailLabel.font = [UIFont systemFontOfSize:14.5];
        self.levelDetailLabel.textColor = [UIColor lightGrayColor];
        self.levelDetailLabel.numberOfLines = 0;
        [view2 addSubview:self.levelLabel];
        [view2 addSubview:self.levelDetailLabel];
        [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2).with.offset(15);
            make.top.equalTo(view2).with.offset(10);

        }];
        [self.levelDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2).with.offset(15);
            make.top.equalTo(self.levelLabel.mas_bottom).with.offset(10);
            make.right.equalTo(view2).with.offset(-10);
            make.bottom.equalTo(view2.mas_bottom).with.offset(-10);

        }];
        
       UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, view2.y+view2.height+7.5, SCREEN_WIDTH, 100)];
        view3.backgroundColor = [UIColor whiteColor];
        self.resumeLabel = [UILabel new];
        self.resumeLabel.font = [UIFont systemFontOfSize:18];
        self.resumeLabel.textColor = [UIColor blackColor];
        self.resumeLabel.text = @"个人简介";
        self.resumeDetailLabel = [UILabel new];
        self.resumeDetailLabel.font = [UIFont systemFontOfSize:14.5];
        self.resumeDetailLabel.textColor = [UIColor lightGrayColor];
        self.resumeDetailLabel.numberOfLines = 0;
        [view3 addSubview:self.resumeLabel];
        [view3 addSubview:self.resumeDetailLabel];
        [self.resumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view3).with.offset(15);
            make.top.equalTo(view3).with.offset(10);
        }];
        [self.resumeDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.resumeLabel);
            make.top.equalTo(self.resumeLabel.mas_bottom).with.offset(10);
            make.right.equalTo(view3.mas_right).with.offset(-10);
            make.bottom.equalTo(view3.mas_bottom).with.offset(-10);
            
        }];
        
        UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(0, view3.y+view3.height+7.5, SCREEN_WIDTH, 60)];
        view4.backgroundColor = [UIColor whiteColor];
        self.goodLabel = [UILabel new];
        self.goodLabel.font = [UIFont systemFontOfSize:18];
        self.goodLabel.textColor = [UIColor blackColor];
        self.goodLabel.text = @"擅长领域";
        self.goodDetailLabel = [UILabel new];
        self.goodDetailLabel.font = [UIFont systemFontOfSize:14.5];
        self.goodDetailLabel.textColor = [UIColor lightGrayColor];
        [view4 addSubview:self.goodLabel];
        [view4 addSubview:self.goodDetailLabel];
        [self.goodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view4).with.offset(15);
            make.top.equalTo(view4).with.offset(10);
        }];
        [self.goodDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.goodLabel);
            make.top.equalTo(self.goodLabel.mas_bottom).with.offset(10);
            make.right.equalTo(view4).with.offset(-10);
            make.bottom.equalTo(view4.mas_bottom).with.offset(-10);
        }];
        
        UIView *view5 = [[UIView alloc]initWithFrame:CGRectMake(0, view4.y+view4.height+7.5, SCREEN_WIDTH, 50)];
        view5.backgroundColor = [UIColor whiteColor];
        self.commentLabel = [UILabel new];
        self.commentLabel.font = [UIFont systemFontOfSize:18];
        self.commentLabel.textColor = [UIColor blackColor];
        self.commentLabel.text = @"全部评价";
        self.commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.commentBtn setImage:[UIImage imageNamed:@"箭头右"] forState:UIControlStateNormal];
        [self.commentBtn addTarget:self action:@selector(clickCommentBtn) forControlEvents:UIControlEventTouchUpInside];
        [view5 addSubview:self.commentLabel];
        [view5 addSubview:self.commentBtn];
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view5).with.offset(15);
            make.centerY.equalTo(view5);
        }];
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view5).with.offset(-30);
            make.centerY.equalTo(view5);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        
        [vi addSubview:view1];
        [vi addSubview:view2];
        [vi addSubview:view3];
        [vi addSubview:view4];
        [vi addSubview:view5];
    }
    
    return self;
}

-(void)clickCommentBtn{
    
}


@end
