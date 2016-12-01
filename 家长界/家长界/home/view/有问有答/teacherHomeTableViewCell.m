//
//  teacherDetailTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "teacherHomeTableViewCell.h"
@implementation teacherHomeTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        self.iconImage = [UIImageView new];
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.layer.cornerRadius = 21;
        [view addSubview:self.iconImage];
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(15);
            make.top.equalTo(view).with.offset(10);
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(42);
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textColor = [UIColor grayColor];
        [view addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage.mas_right).with.offset(7.5);
            make.top.equalTo(view).with.offset(10);
        }];
        
        self.timeLabel = [UILabel new];
        self.timeLabel.font = [UIFont systemFontOfSize:13.5];
        self.timeLabel.textColor = [UIColor grayColor];
        [view addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
            make.left.equalTo(self.titleLabel);
        }];
        
        self.questionLabel = [UILabel new];
        self.questionLabel.font = [UIFont systemFontOfSize:16];
        self.questionLabel.textColor = [UIColor blackColor];
        self.questionLabel.numberOfLines = 0;
        [view addSubview:self.questionLabel];
        [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(15);
            make.top.equalTo(self.iconImage.mas_bottom).with.offset(10);
            make.right.equalTo(view).with.offset(-10);
            make.bottom.greaterThanOrEqualTo(view).with.offset(5);
            
        }];
        
    }
    return self;
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
