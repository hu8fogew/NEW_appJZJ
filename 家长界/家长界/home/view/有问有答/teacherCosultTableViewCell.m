//
//  teacherCosultTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "teacherCosultTableViewCell.h"

@implementation teacherCosultTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = 19;
        [view addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(10);
            make.top.equalTo(view).with.offset(10);
            make.width.mas_equalTo(38);
            make.height.mas_equalTo(38);
        }];
        
        self.nameLabel = [UILabel new];
        self.nameLabel.font = [UIFont systemFontOfSize:18];
        self.nameLabel.textColor = [UIColor grayColor];
        [view addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imgView);
            make.left.equalTo(self.imgView.mas_right).with.offset(7.5);
        }];
        
        self.numberLabel = [UILabel new];
        self.numberLabel.font = [UIFont systemFontOfSize:18];
        self.numberLabel.textColor = [UIColor blackColor];
        [view addSubview:self.numberLabel];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view).with.offset(-10);
            make.centerY.equalTo(self.nameLabel);
            
        }];
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"赞赞"];
        [view addSubview:self.iconImage];
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-5);
            make.centerY.equalTo(self.numberLabel);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        
        self.questionLabel = [UILabel new];
        self.questionLabel.font = [UIFont systemFontOfSize:18];
        self.questionLabel.textColor = [UIColor blackColor];
        self.questionLabel.numberOfLines = 0;
        [view addSubview:self.questionLabel];
        [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10);
            make.right.equalTo(view).with.offset(-5);
        }];
        
        self.answerLabel = [UILabel new];
        self.answerLabel.font = [UIFont systemFontOfSize:14.5];
        self.answerLabel.textColor = [UIColor lightGrayColor];
        self.answerLabel.numberOfLines = 0;
        [view addSubview:self.answerLabel];
        [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.questionLabel);
            make.top.equalTo(self.questionLabel.mas_bottom).with.offset(10);
            make.right.equalTo(view).with.offset(-10);
            make.bottom.greaterThanOrEqualTo(view).with.offset(10);
            
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
