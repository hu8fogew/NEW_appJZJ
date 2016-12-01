//
//  TeacherDetailView.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherDetailView.h"

@implementation TeacherDetailView

/*老师图像直径*/
static const int teacherIconCornRadius = 97.5;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
        
        [self addSubview:vi];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:vi.bounds];;
        imgView.image = [UIImage imageNamed:@"backImage.jpg"];
        
        [vi addSubview:imgView];
        
        self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
        [vi addSubview:self.backBtn];
        [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(10);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        
        self.imgView = [UIImageView new];
        self.imgView.image = [UIImage imageNamed:@"icon"];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = teacherIconCornRadius/2;
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset((SCREEN_WIDTH-teacherIconCornRadius)/2);
            make.top.equalTo(vi.mas_top).with.offset(22.5);
            make.width.mas_equalTo(teacherIconCornRadius);
            make.height.mas_equalTo(teacherIconCornRadius);
        }];
        
        self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [self.moreBtn addTarget:self action:@selector(clickMoreBtn) forControlEvents:UIControlEventTouchUpInside];
        [vi addSubview:self.moreBtn];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi.mas_top).with.offset(10);
            make.right.equalTo(vi.mas_right).with.offset(-10);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        
        self.nameLabel = [UILabel new];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont systemFontOfSize:21.5];
        [vi addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(14.5);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.iconView = [UIImageView new];
        self.iconView.image = [UIImage imageNamed:@"男"];
        [vi addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).with.offset(7.5);
            make.centerY.equalTo(self.nameLabel);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textColor = [UIColor whiteColor];
        [vi addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(13.5);
            make.centerX.equalTo(self.nameLabel);
        }];
        
        self.consultLabel = [UILabel new];
        self.consultLabel.font = [UIFont systemFontOfSize:14.5];
        self.consultLabel.textColor = [UIColor whiteColor];
        [vi addSubview:self.consultLabel];
        [self.consultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(13.5);
        }];
        
        self.firstView = [UIView new];
        self.firstView.backgroundColor = [UIColor whiteColor];
        [vi addSubview:self.firstView];
        [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.consultLabel.mas_left).with.offset(-7.5);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(13.5);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(15);
        }];
        
        self.commentLabel = [UILabel new];
        self.commentLabel.font = [UIFont systemFontOfSize:14.5];
        self.commentLabel.textColor = [UIColor whiteColor];
        [vi addSubview:self.commentLabel];
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.firstView.mas_left).with.offset(-7.5);
            make.centerY.equalTo(self.consultLabel);
        }];
        
        self.secondView = [UIView new];
        self.secondView.backgroundColor = [UIColor whiteColor];
        [vi addSubview:self.secondView];
        [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.consultLabel.mas_right).with.offset(7.5);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(13.5);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(15);
            
        }];
        
        self.likeLabel = [UILabel new];
        self.likeLabel.font = [UIFont systemFontOfSize:14.5];
        self.likeLabel.textColor = [UIColor whiteColor];
        [vi addSubview:self.likeLabel];
        [self.likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.secondView.mas_right).with.offset(7.5);
            make.centerY.equalTo(self.consultLabel);
        }];
        
        
    }
    
    return self;
}

-(void)clickBackBtn{
    
}

-(void)clickMoreBtn{
    
}

@end
