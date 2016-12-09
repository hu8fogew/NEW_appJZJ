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
        //图标
        self.teacherImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH/10, SCREEN_WIDTH/10)];
        self.teacherImage.layer.cornerRadius = SCREEN_WIDTH/20;
        self.teacherImage.layer.masksToBounds = YES;
        self.teacherImage.backgroundColor = [UIColor blackColor];
        //老师名称
        self.teacherName = [self addLabelWithFrame:CGRectMake(self.teacherImage.x+self.teacherImage.width+5, self.teacherImage.y, vi.width/5, self.teacherImage.height) andTextColor:HWColor(150, 150, 150) andTextSize:18 andTextAlignment:NSTextAlignmentLeft];
        //点赞图片
        self.smallImage = [[UIImageView alloc]initWithFrame:CGRectMake(vi.width-40-self.teacherName.height/2, self.teacherName.y+self.teacherName.height/6, self.teacherName.height/2, self.teacherName.height/2)];
        //点赞人数
        self.number = [self addLabelWithFrame:CGRectMake(vi.width-40, self.smallImage.y, 30, self.smallImage.height) andTextColor:HWColor(150, 150, 150) andTextSize:17 andTextAlignment:NSTextAlignmentRight];
        
        //问题编辑
        self.textEditView = [[UIView alloc]initWithFrame:CGRectMake(self.teacherName.x, self.teacherName.y+self.teacherName.height, self.number.x-self.teacherName.x, 40)];
        self.textEditView.backgroundColor = [UIColor whiteColor];
        self.textView = [[UILabel alloc]initWithFrame:self.textEditView.bounds];
        
        self.textView.textColor = HWColor(53, 53, 53);
        self.textView.font = [UIFont systemFontOfSize:16];
        [self.textEditView addSubview:self.textView];
        [self addSubview:self.textEditView];
        
        
        
        
        
        
        
        //时间和打赏视图
        self.awradView = [[UIView alloc]initWithFrame:CGRectMake(self.textEditView.x, vi.height*0.75, vi.width-self.textEditView.x-10, vi.height*0.17)];
        self.awradView.userInteractionEnabled = YES;
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.awradView.width/3, self.awradView.height)];
        self.timeLabel.textColor = HWColor(150, 150, 150);
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        
        self.awardBtn = [[UIImageView alloc]init];
        self.awardBtn.layer.cornerRadius = 4;
        self.awardBtn.layer.masksToBounds = YES;
        self.awardBtn.frame = CGRectMake(self.awradView.width*5/6, self.awradView.height*1/10, self.awradView.width/6, self.awradView.height*4/5);
        
        [self.awradView addSubview:self.awardBtn];
        [self.awradView addSubview:self.timeLabel];
        [vi addSubview:self.awradView];
        [vi addSubview:self.smallImage];
        [vi addSubview:self.teacherImage];
        
    }
    return self;
}

-(void)awardClick
{
    HWLog(@"打赏");
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
