//
//  TeacherTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/21.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherTableViewCell.h"

@implementation TeacherTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HWColor(242, 242, 242);
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120-2)];
        vi.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:vi];
        
        self.teacherImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, vi.height-30, vi.height-30)];
        self.teacherImage.layer.cornerRadius = (vi.height-30)/2;
        self.teacherImage.layer.masksToBounds = YES;
        self.mainTeacherLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.teacherImage.x+self.teacherImage.width+10, 15, vi.width/4, self.teacherImage.height/3)];
        self.mainTeacherLabel.font = [UIFont systemFontOfSize:20];
        self.mainTeacherLabel.textColor = [UIColor blackColor];
        self.numberOfRequire = [[UILabel alloc]initWithFrame:CGRectMake(vi.width-80, 15, 80, self.mainTeacherLabel.height)];
        self.numberOfRequire.textColor = HWColor(141, 141, 141);
        self.numberOfRequire.font = [UIFont systemFontOfSize:14];
        
        self.wdLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.mainTeacherLabel.x, self.mainTeacherLabel.y+self.mainTeacherLabel.height, vi.width-self.mainTeacherLabel.x, self.mainTeacherLabel.height)];
        self.wdLabel.font = [UIFont systemFontOfSize:14];
        self.wdLabel.textColor = HWColor(141, 141, 141);
        
        self.teachKindView = [[UIView alloc]initWithFrame:CGRectMake(self.mainTeacherLabel.x, self.wdLabel.y+self.wdLabel.height, vi.width-self.mainTeacherLabel.x, self.teacherImage.height/3)];
        
        [vi addSubview:self.teachOfKindLabel];
        [vi addSubview: self.numberOfRequire];
        [vi addSubview:self.wdLabel];
        [vi addSubview:self.mainTeacherLabel];
        [vi addSubview:self.teacherImage];
        [vi addSubview:self.teachKindView];
        
        
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
