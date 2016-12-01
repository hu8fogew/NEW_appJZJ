//
//  QuestionTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/11/21.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QuestionTableViewCell.h"

@implementation QuestionTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = HWColor(242, 242, 242);
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.questionLabel = [[UILabel alloc]initWithFrame: CGRectMake(20, vi.height/4-10, SCREEN_WIDTH - 100, vi.height/4)];
        self.questionLabel.font = [UIFont systemFontOfSize:15];
        self.questionLabel.textColor = [UIColor blackColor];
        self.numberOfQuestion = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH*3)/4, self.questionLabel.y, 100, self.questionLabel.height)];
        self.numberOfQuestion.textColor = [UIColor orangeColor];
        self.numberOfQuestion.font = [UIFont systemFontOfSize:14];
        self.teacherImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.questionLabel.y+self.questionLabel.height+10, self.questionLabel.height, self.questionLabel.height)];
        self.teacherImage.layer.cornerRadius = self.questionLabel.height/2;
        self.teacherImage.layer.masksToBounds = YES;
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.teacherImage.x+self.teacherImage.width+20, self.teacherImage.y, vi.width-self.teacherImage.width-110, self.questionLabel.height)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor grayColor];
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH*3)/4, self.teacherImage.y+10, 100, self.questionLabel.height)];
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel.font = [UIFont systemFontOfSize:14];

        
        [vi addSubview:self.questionLabel];
        [vi addSubview:self.teacherImage];
        [vi addSubview:self.titleLabel];
        [vi addSubview:self.numberOfQuestion];
        [vi addSubview:self.timeLabel];
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
