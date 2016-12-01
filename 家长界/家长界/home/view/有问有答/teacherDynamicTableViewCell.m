//
//  teacherDynamicTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "teacherDynamicTableViewCell.h"

@implementation teacherDynamicTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        view.backgroundColor = HWColor(242, 242, 242);
        [self addSubview:view];
    
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = 21;
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(15);
            make.top.equalTo(vi).with.offset(10);
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(42);
        }];
        self.nameLabel = [UILabel new];
        self.nameLabel.font = [UIFont systemFontOfSize:18];
        self.nameLabel.textColor = [UIColor blackColor];
        [vi addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(7.5);
            make.top.equalTo(self.imgView.mas_top);
        }];
        self.timeLabel = [UILabel new];
        self.timeLabel.font = [UIFont systemFontOfSize:14.5];
        self.timeLabel.textColor = [UIColor grayColor];
        [vi addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(5);
        }];
        self.phoneLabel = [UILabel new];
        self.phoneLabel.textColor = [UIColor lightGrayColor];
        self.phoneLabel.font = [UIFont systemFontOfSize:14.5];
        [vi addSubview:self.phoneLabel];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.timeLabel);
        }];
        self.dynamicLabel = [UILabel new];
        self.dynamicLabel.font = [UIFont systemFontOfSize:18];
        self.dynamicLabel.textColor = [UIColor blackColor];
        self.dynamicLabel.numberOfLines = 0;
        [vi addSubview:self.dynamicLabel];
        [self.dynamicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.right.equalTo(vi).with.offset(-10);
            make.top.equalTo(self.timeLabel.mas_bottom).with.offset(10);
        }];
        
        UIView *vieww = [UIView new];
        vieww.backgroundColor = HWColor(242, 242, 242);
        [vi addSubview:vieww];
        [vieww mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.top.equalTo(self.dynamicLabel.mas_bottom).with.offset(10);
        }];
        
        UIView *view1 = [UIView new];
        view1.backgroundColor = [UIColor whiteColor];
        [vi addSubview:view1];
        view1.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapView1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView1)];
        [view1 addGestureRecognizer:tapView1];
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vieww.mas_bottom).with.offset(1);
            make.left.equalTo(vieww);
            make.width.mas_equalTo(SCREEN_WIDTH/3-1);
            make.height.mas_equalTo(48);
            make.bottom.greaterThanOrEqualTo(vi.mas_bottom).with.priority(10);

        }];
        self.sendImage = [UIImageView new];
        self.sendImage.image = [UIImage imageNamed:@"转发"];
        [view1 addSubview:self.sendImage];
        [self.sendImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1).with.offset((SCREEN_WIDTH/3-1)/3);
            make.centerY.equalTo(view1);
            make.width.mas_equalTo(23);
            make.height.mas_equalTo(23);
        }];
        self.sendNoLabel = [UILabel new];
        self.sendNoLabel.textColor = [UIColor lightGrayColor];
        self.sendNoLabel.font = [UIFont systemFontOfSize:18];
        [view1 addSubview:self.sendNoLabel];
        [self.sendNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.sendImage.mas_right).with.offset(5);
            make.centerY.equalTo(self.sendImage);
        }];
        
        UIView *firstView = [UIView new];
        firstView.backgroundColor = HWColor(242, 242, 242);
        [vi addSubview:firstView];
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vieww.mas_bottom).with.offset(12);
            make.left.equalTo(view1.mas_right);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(24);
        }];
        
        UIView *view2 = [UIView new];
        view2.backgroundColor = [UIColor whiteColor];
        [vi addSubview:view2];
        view2.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapView2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView2)];
        [view2 addGestureRecognizer:tapView2];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstView.mas_right);
            make.top.equalTo(vieww.mas_bottom).with.offset(1);
            make.height.mas_equalTo(48);
            make.width.mas_equalTo(SCREEN_WIDTH/3-1);
            make.bottom.greaterThanOrEqualTo(vi.mas_bottom).with.priority(10);

        }];
        self.commentImage = [UIImageView new];
        self.commentImage.image = [UIImage imageNamed:@"评论"];
        [view2 addSubview:self.commentImage];
        [self.commentImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2).with.offset((SCREEN_WIDTH/3-1)/3);
            make.centerY.equalTo(view2);
            make.width.mas_equalTo(23);
            make.height.mas_equalTo(23);
        }];
        self.commentNoLabel = [UILabel new];
        self.commentNoLabel.textColor = [UIColor grayColor];
        self.commentNoLabel.font = [UIFont systemFontOfSize:18];
        [view2 addSubview:self.commentNoLabel];
        [self.commentNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commentImage.mas_right).with.offset(5);
            make.centerY.equalTo(self.commentImage);
        }];
        
        UIView *secondView = [UIView new];
        secondView.backgroundColor = HWColor(242, 242, 242);
        [vi addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2.mas_right);
            make.top.equalTo(vieww.mas_bottom).with.offset(12);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(24);
        }];
    
        UIView *view3 = [UIView new];
        view3.backgroundColor = [UIColor whiteColor];
        [vi addSubview:view3];
        view3.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapView3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView3)];
        [view3 addGestureRecognizer:tapView3];
        [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(secondView.mas_right);
            make.top.equalTo(vieww.mas_bottom).with.offset(1);
            make.height.mas_equalTo(48);
            make.width.mas_equalTo(SCREEN_WIDTH/3);
            make.bottom.greaterThanOrEqualTo(vi.mas_bottom).with.priority(10);
        }];
        self.praiseImage = [UIImageView new];
        self.praiseImage.image = [UIImage imageNamed:@"赞赞"];
        [view3 addSubview:self.praiseImage];
        [self.praiseImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view3).with.offset((SCREEN_WIDTH/3)/3);
            make.centerY.equalTo(view3);
            make.width.mas_equalTo(23);
            make.height.mas_equalTo(23);
        }];
        self.praiseNoLabel = [UILabel new];
        self.praiseNoLabel.font = [UIFont systemFontOfSize:18];
        self.praiseNoLabel.textColor = [UIColor grayColor];
        [view3 addSubview:self.praiseNoLabel];
        [self.praiseNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.praiseImage.mas_right).with.offset(5);
            make.centerY.equalTo(self.praiseImage);
        }];
    }
    return self;
}

-(void)clickView1{
    HWLog(@"转发");
}
-(void)clickView2{
    HWLog(@"评论");

}
-(void)clickView3{
    HWLog(@"点赞");
 
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
