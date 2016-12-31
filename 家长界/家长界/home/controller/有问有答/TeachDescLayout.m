//
//  TeachDescLayout.m
//  家长界
//
//  Created by mac on 2016/12/31.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeachDescLayout.h"

@implementation TeachDescLayout

-(id)copyWithZone:(NSZone *)zone
{
    TeachDescLayout *one = [[TeachDescLayout alloc]init];
    one.descViewHeight = self.descViewHeight;
    
    return one;
}


-(id)initDescTeacherView
{
    self = [super init];
    if (self) {
        
        //名言
        LWTextStorage *motto = [self createTextStorageWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(leftToMargin, topToMargin, SCREEN_WIDTH-leftToMargin*2, CGFLOAT_MAX)];
        motto.text = @"当你迷茫的时候，就唱一唱歌，当你失落的时候，就笑一笑；当你绝望的时候，就听一首歌吧！当你迷茫的时候，就唱一唱歌，当你失落的时候，就笑一笑；当你绝望的时候，就听一首歌吧！当你迷茫的时候，就唱一唱歌，当你失落的时候，就笑一笑；当你绝望的时候，就听一首歌吧！";
        
        LWImageStorage *imageF = [[LWImageStorage alloc]init];
        imageF.frame = CGRectMake(0, motto.bottom+10, SCREEN_WIDTH, 8);
        imageF.contents = [UIImage imageNamed:@"line_icon_image"];
        [self addStorage:imageF];
        //从业等级
        LWTextStorage *workE = [self createTextStorageWithTextColor:HWColor(51, 51,51) andTextFont:17 andFrame:CGRectMake(motto.left, imageF.bottom+15, motto.width, CGFLOAT_MAX)];
        workE.text = @"从业资质";
        
        //等级
        LWTextStorage *rank = [self createTextStorageWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(workE.left, workE.bottom+5, motto.width, CGFLOAT_MAX)];
        rank.text = @"国家二级咨询师";
        
        LWImageStorage *imageS = [[LWImageStorage alloc]init];
        imageS.frame = CGRectMake(0, rank.bottom+10, SCREEN_WIDTH, 8);
        imageS.contents = [UIImage imageNamed:@"line_icon_image"];
        [self addStorage:imageS];
        
        //个人简介
        LWTextStorage *intro = [self createTextStorageWithTextColor:HWColor(51, 51, 51) andTextFont:17 andFrame:CGRectMake(motto.left, imageS.bottom+15, motto.width, CGFLOAT_MAX)];
        intro.text = @"个人简介";
        //介绍
        LWTextStorage *desc = [self createTextStorageWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(motto.left, intro.bottom+5, motto.width, CGFLOAT_MAX)];
        desc.text = @"这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。这里有各种创意心理应用。";
        
        LWImageStorage *imageT = [[LWImageStorage alloc]init];
        imageT.frame = CGRectMake(0, desc.bottom+10, SCREEN_WIDTH, 8);
        imageT.contents = [UIImage imageNamed:@"line_icon_image"];
        [self addStorage:imageT];
        
        //擅长领域
        LWTextStorage *good = [self createTextStorageWithTextColor:HWColor(51, 51, 51) andTextFont:17 andFrame:CGRectMake(motto.left, imageT.bottom+15, motto.width, CGFLOAT_MAX)];
        good.text = @"擅长领域";
        //擅长
        LWTextStorage *wellText = [self createTextStorageWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(motto.left, good.bottom+5, motto.width, CGFLOAT_MAX)];
        wellText.text = @"2013年7月 - 2014年7月 西北农林科技大学 会计 硕士";
        
        LWImageStorage *imageFo = [[LWImageStorage alloc]init];
        imageFo.frame = CGRectMake(0, wellText.bottom+10, SCREEN_WIDTH, 8);
        imageFo.contents = [UIImage imageNamed:@"line_icon_image"];
        [self addStorage:imageFo];
        
        //评论
        LWTextStorage *comment = [self createTextStorageWithTextColor:HWColor(51, 51, 51) andTextFont:17 andFrame:CGRectMake(motto.left, imageFo.bottom+15, CGFLOAT_MAX, CGFLOAT_MAX)];
        comment.text = @"全部评论(66)";
        
        //评论个数
        
        NSString *str = @"个好评";
        
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *num = [self createTextStorageWithTextColor:HWColor(205, 96, 55) andTextFont:15 andFrame:CGRectMake(SCREEN_WIDTH/2, comment.top, SCREEN_WIDTH/2-10-size.width, CGFLOAT_MAX)];
        num.textAlignment = NSTextAlignmentRight;
        num.text = @"66";
        
        
        //number
        LWTextStorage *numtext = [self createTextStorageWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(SCREEN_WIDTH-size.width-10, num.top, size.width, CGFLOAT_MAX)];
        numtext.text = str;
        
        self.descViewHeight = [self suggestHeightWithBottomMargin:10];
    }
    return self;
}





-(LWTextStorage *)createTextStorageWithTextColor:(UIColor*)color andTextFont:(CGFloat)size andFrame:(CGRect)frame
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.backgroundColor = [UIColor whiteColor];
    text.frame = frame;
    text.textColor = color;
    text.linespacing = 4.0f;
    text.font = [UIFont systemFontOfSize:size];
    
    [self addStorage:text];
    
    return text;
}


@end
