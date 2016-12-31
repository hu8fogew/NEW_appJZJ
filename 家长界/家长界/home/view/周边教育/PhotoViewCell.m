//
//  PhotoViewCell.m
//  家长界
//
//  Created by mac on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PhotoViewCell.h"
#import "LWAsyncDisplayView.h"

@interface PhotoViewCell()<LWAsyncDisplayViewDelegate>



@end


@implementation PhotoViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
               
    }
    
    return self;
}




@end
