//
//  ParentTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentTableViewCell.h"

@implementation ParentTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = HWColor(242, 242, 242);
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ParentCellHeight-DistanceForCell)];
        vi.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:vi];
        
        self.PimageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH/3+20, vi.height-30)];
        self.PmainLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.PimageLogo.x+self.PimageLogo.width+10, 15, SCREEN_WIDTH-(self.PimageLogo.x+self.PimageLogo.width+5), self.PimageLogo.height/3)];
        self.PmainLabel.font = [UIFont systemFontOfSize:18];
        self.PmainLabel.textColor = [UIColor blackColor];
        
     
        self.Plabel1 = [[UILabel alloc]initWithFrame:CGRectMake(self.PmainLabel.x, self.PmainLabel.y+self.PmainLabel.height, (self.PimageLogo.width*3)/4, self.PmainLabel.height)];
        self.Plabel1.font = [UIFont systemFontOfSize:14];
        self.Plabel1.textColor = HWColor(141, 141, 141);
        self.plabel2 = [[UILabel alloc]initWithFrame:CGRectMake(self.Plabel1.x+self.Plabel1.width, self.Plabel1.y, SCREEN_WIDTH-(self.Plabel1.x+self.Plabel1.width), self.Plabel1.height)];
        self.plabel2.font = [UIFont systemFontOfSize:14];
        self.plabel2.textColor = HWColor(141, 141, 141);
        self.PkindLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.PmainLabel.x, self.Plabel1.y+self.Plabel1.height+4, self.PimageLogo.width/2-5, self.PimageLogo.height/3-8)];
        self.PkindLabel.font = [UIFont systemFontOfSize:16];
        self.PkindLabel.layer.borderColor = [HWColor(146, 210, 205) CGColor];
        self.PkindLabel.textAlignment = 1;
        self.PkindLabel.layer.borderWidth = 1;
        self.PkindLabel.textColor = HWColor(146, 210, 205);
        self.PkindLabel.layer.cornerRadius = 3;
        self.PkindLabel.layer.masksToBounds = YES;
        
        self.priceLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, self.PkindLabel.y, 60, self.PkindLabel.height)];
        self.priceLable.font = [UIFont systemFontOfSize:16];
        self.priceLable.textColor = [UIColor redColor];
        
        [vi addSubview:self.priceLable];
        [vi addSubview:self.PkindLabel];
        [vi addSubview: self.plabel2];
        [vi addSubview:self.Plabel1];
        [vi addSubview:self.PmainLabel];
        [vi addSubview:self.PimageLogo];
        
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
