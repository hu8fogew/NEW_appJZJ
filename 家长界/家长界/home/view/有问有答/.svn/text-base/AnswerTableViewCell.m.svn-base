//
//  AnswerTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerTableViewCell.h"

@interface AnswerTableViewCell()

@property(nonatomic,strong)UIView *vi;
@end


@implementation AnswerTableViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HWColor(242, 242, 242);
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,170 -3)];
        vi.backgroundColor = [UIColor whiteColor];
        self.vi = vi;
        [self addSubview:vi];
        self.teacherImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH/9, SCREEN_WIDTH/9)];
        self.teacherImage.layer.cornerRadius = SCREEN_WIDTH/20;
        self.teacherImage.layer.masksToBounds = YES;
        self.teacherImage.backgroundColor = [UIColor blackColor];
        self.teacherName = [self addLabelWithFrame:CGRectMake(self.teacherImage.x+self.teacherImage.width+5, self.teacherImage.y, vi.width/5, self.teacherImage.height/2) andTextColor:HWColor(150, 150, 150) andTextSize:18 andTextAlignment:NSTextAlignmentLeft];
        
        self.smallImage = [[UIImageView alloc]initWithFrame:CGRectMake(vi.width-80, self.teacherName.y+self.teacherName.height/6, self.teacherName.height, self.teacherName.height)];
        
        self.number = [self addLabelWithFrame:CGRectMake(self.smallImage.x+self.smallImage.width+5, self.smallImage.y, 80-self.smallImage.width, self.teacherName.height) andTextColor:HWColor(150, 150, 150) andTextSize:18 andTextAlignment:NSTextAlignmentLeft];
        
        self.mainLabel = [self addLabelWithFrame:CGRectMake(self.teacherName.x, self.teacherName.y+self.teacherName.height, vi.width-self.teacherName.x-10, self.teacherName.height) andTextColor:HWColor(150, 150, 150) andTextSize:14 andTextAlignment:NSTextAlignmentLeft];
        
        self.detialLabel = [self addLabelWithFrame:CGRectMake(self.teacherName.x, self.mainLabel.y+self.mainLabel.height+6, self.mainLabel.width, vi.height-(self.mainLabel.y+self.mainLabel.height+5)) andTextColor:HWColor(150, 150, 150) andTextSize:16 andTextAlignment:NSTextAlignmentNatural];
        self.detialLabel.numberOfLines = 0;
        [vi addSubview:self.smallImage];
        [vi addSubview:self.teacherImage];
        
    }
    return self;
}





-(UILabel *)addLabelWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextSize:(CGFloat)size andTextAlignment:(NSTextAlignment)align
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:size];
    lab.textAlignment = align;
    [self.vi addSubview:lab];
    
    return lab;
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
