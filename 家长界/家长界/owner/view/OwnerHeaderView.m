//
//  OwnerHeaderView.m
//  家长界
//
//  Created by mac on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "OwnerHeaderView.h"

@implementation OwnerHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"set_image"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickSetBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(SCREEN_WIDTH-50, 10, 35, 35);
        
        [self addSubview:btn];
        
        
        _ownerImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, self.height*1/3+self.height/12, self.height*2/3-self.height/6, self.height*2/3-self.height/6)];
        _ownerImage.layer.cornerRadius = (self.height*2/3-self.height/8)/2;
        _ownerImage.layer.masksToBounds = YES;
        
        [self addSubview:_ownerImage];
        
        _ownerName = [[UILabel alloc]initWithFrame:CGRectMake(_ownerImage.x+_ownerImage.width+10, _ownerImage.y+_ownerImage.height/4, SCREEN_WIDTH/4, _ownerImage.height/4)];
        _ownerName.font = [UIFont systemFontOfSize:18];
        _ownerName.textColor = [UIColor whiteColor];
        _ownerName.text = @"家长界用户";
        _ownerName.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_ownerName];
        
        
        
    }
    return self;
}


-(void)clickSetBtn:(UIButton *)sender
{
    HWLog(@"设置");
}


@end
