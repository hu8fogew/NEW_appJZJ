//
//  PhotoViewCell.m
//  家长界
//
//  Created by mac on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PhotoViewCell.h"

@implementation PhotoViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //图片视图
        self.userInteractionEnabled = YES;
        _picContainerView = [[YHWorkGroupPhotoContainer alloc]initWithWidth:SCREEN_WIDTH-20];
        
        [self addSubview:_picContainerView];
        [_picContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.height.mas_equalTo(self.height);
        }];
        [_picContainerView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
        [_picContainerView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
        
        
        
        
    }
    
    return self;
}




@end
