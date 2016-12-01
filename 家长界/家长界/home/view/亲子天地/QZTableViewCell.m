//
//  QZTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/17.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QZTableViewCell.h"

@implementation QZTableViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HWColor(242, 242, 242);
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ParentCellHeight-DistanceForCell)];
        vi.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:vi];
        
        self.qzImageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH/4+20, vi.height-30)];
        self.qzMainLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.qzImageLogo.x+self.qzImageLogo.width+10, 15, SCREEN_WIDTH-(self.qzImageLogo.x+self.qzImageLogo.width+5), self.qzImageLogo.height/3)];
        self.qzMainLabel.font = [UIFont systemFontOfSize:17];
        self.qzMainLabel.textColor = [UIColor blackColor];
        
        
        self.qzLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.qzMainLabel.x, self.qzMainLabel.y+self.qzMainLabel.height, vi.width-self.qzMainLabel.x, self.qzMainLabel.height)];
        self.qzLabel.font = [UIFont systemFontOfSize:13];
        self.qzLabel.textColor = HWColor(141, 141, 141);
        self.actionKindView = [[UIView alloc]initWithFrame:CGRectMake(self.qzMainLabel.x, self.qzLabel.y+self.qzLabel.height, vi.width*4/9, self.qzImageLogo.height/3)];
//        self.actionKindView.backgroundColor = [UIColor cyanColor];
        
        self.qzNumberOfPerson = [[UILabel alloc]initWithFrame:CGRectMake(self.actionKindView.x+self.actionKindView.width, self.actionKindView.y, vi.width-self.actionKindView.x-self.actionKindView.width, self.actionKindView.height)];
        self.qzNumberOfPerson.font = [UIFont systemFontOfSize:12];
        self.qzNumberOfPerson.textColor = [UIColor redColor];
        [vi addSubview:self.actionKindView];
        [vi addSubview:self.qzNumberOfPerson];
        [vi addSubview:self.qzLabel];
        [vi addSubview:self.qzMainLabel];
        [vi addSubview:self.qzImageLogo];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
