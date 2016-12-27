//
//  AnswerDetialHeader.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerDetialHeader.h"
#import "LWTextParser.h"
@implementation AnswerDetialHeader


-(instancetype)init
{
    self = [super init];
    if (self) {
        //问号
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.contents = [UIImage imageNamed:@"WH"];
        image.frame = CGRectMake(10, 15, 20, 20);
        image.backgroundColor = [UIColor whiteColor];
        //问题主标题
        LWTextStorage *mainQuestion = [[LWTextStorage alloc]init];
        mainQuestion.text = @"如何实现现代化建设，是当代90、00后的伟大使命。所以从孩子抓起，那么怎么抓起呢？";
        mainQuestion.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
        mainQuestion.textColor = RGB(40, 40, 40, 1);
        mainQuestion.frame = CGRectMake(image.left,
                                              image.top,
                                              SCREEN_WIDTH - 40.0f,
                                              CGFLOAT_MAX);
        
        [self addStorage:image];
        [self addStorage:mainQuestion];
        
        self.headerHeight = [self suggestHeightWithBottomMargin:10.0f];
        
        
    }
    return self;
}





@end
