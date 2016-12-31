//
//  DetialQuestionLayout.m
//  家长界
//
//  Created by mac on 2016/12/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "DetialQuestionLayout.h"

@implementation DetialQuestionLayout


- (id)copyWithZone:(NSZone *)zone {
    DetialQuestionLayout* one = [[DetialQuestionLayout alloc] init];
    one.headerHeight = self.headerHeight;
    one.wdCellHeight = self.wdCellHeight;
    return one;
}



#pragma mark --------问答页面；
-(instancetype)initAnswerQuestion
{
    self = [super init];
    if (self) {
        //问号
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.contents = [UIImage imageNamed:@"WH"];
        image.frame = CGRectMake(10, 18, 20, 20);
        image.backgroundColor = [UIColor whiteColor];
        //问题主标题
        LWTextStorage *mainQuestion = [self createTextWithTextColor:HWColor(42, 42, 42) andTextFont:18 andFrame:CGRectMake(image.right+3,
                                                                                                                           15,
                                                                                                                           SCREEN_WIDTH - 43.0f,
                                                                                                                           CGFLOAT_MAX)];
        mainQuestion.text = @"如何实现现代化建设，是当代90、00后的伟大使命。所以从孩子抓起，那么怎么抓起呢？";
        
//        mainQuestion.font = [UIFont fontWithName:@"AppleGothic" size:17];
        //用户
        LWTextStorage *userStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(mainQuestion.left, mainQuestion.bottom+5, CGFLOAT_MAX, 30)];
        userStorsge.text = @"企聘通用户";
        
        //线
        CGRect lineF = CGRectZero;
        lineF = CGRectMake(userStorsge.right+8, userStorsge.top, 1.5, userStorsge.height);
        //浏览次数
        LWTextStorage *numStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(lineF.origin.x+9.5, userStorsge.top, CGFLOAT_MAX, 30)];
        numStorsge.text = @"浏览60次";
        
        //线second
        CGRect lineS = CGRectZero;
        lineS = CGRectMake(numStorsge.right+8, userStorsge.top, 1.5, userStorsge.height);
        //发布时间
        
        LWTextStorage *dateStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(lineS.origin.x+9.5, userStorsge.top, CGFLOAT_MAX, 30)];
        dateStorsge.text = @"2016-10-21 11:57";
        //问题详情
        LWTextStorage *detialStorsge = [self createTextWithTextColor:HWColor(80, 80, 80) andTextFont:16 andFrame:CGRectMake(mainQuestion.left, dateStorsge.bottom+5, mainQuestion.width, CGFLOAT_MAX)];
        detialStorsge.text = @"问题描述：孩子碰到不顺心的事情就喜欢摔东西、骂人等烦躁的行为。造成脾气越来越大，没有人能管的了的地步。对于这种行为的解决方式是怎么解决的？";
        //回答个数
        LWTextStorage *answerNumStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(detialStorsge.left, detialStorsge.bottom+8, detialStorsge.width, 30)];
        answerNumStorsge.text = @"35个回答";
        answerNumStorsge.textAlignment = NSTextAlignmentRight;
        
        [self addStorage:image];
        self.headerHeight = [self suggestHeightWithBottomMargin:10.0f];
        self.lineF = lineF;
        self.lineS = lineS;
    }
    return self;
}

#pragma mark -----------有问有答的首页问题布局
-(instancetype)initQuestionDeatail
{
    self = [super init];
    if (self) {
        //老师头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.cornerRadius = 15;
        image.contents = [UIImage imageNamed:@"teacherImage"];
        image.frame = CGRectMake(10, 15, imageWH, imageWH);
        image.cornerBorderWidth = 1.0f;
        image.cornerBorderColor = HWColor(241, 241, 241);
        image.cornerBackgroundColor = [UIColor whiteColor];
        
        
        //教育类型
        LWTextStorage *nameStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:14 andFrame:CGRectMake(image.right+5, 25, CGFLOAT_MAX, 30)];
        nameStorsge.text = @"西部家联教育";
        
        //发布的时间
        LWTextStorage *dateStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:14 andFrame:CGRectMake(nameStorsge.right+10, nameStorsge.top, CGFLOAT_MAX, nameStorsge.height)];
        dateStorsge.text = @"10小时前";
        
        //主标题问题
        LWTextStorage *mainQues = [self createTextWithTextColor:HWColor(51, 51, 51) andTextFont:17 andFrame:CGRectMake(image.left, image.bottom+6, SCREEN_WIDTH-20, 40)];
        mainQues.text = @"为什么快餐时代的充斥导致现代的人们不能静下心来酿一壶好酒呢？";
        //问题回答
        LWTextStorage *detialStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:15 andFrame:CGRectMake(mainQues.left, mainQues.bottom+8, mainQues.width, CGFLOAT_MAX)];
        detialStorsge.maxNumberOfLines = 3;
        
        detialStorsge.text = @"从业十余年来，精通各种技术的人么有都少，运用自如的人更是少之又少，之所以成为这样的情况，是因为快餐时代的充斥，是大部分人习惯了快餐的节奏，没有精益求精的耐心去学习，深造。使得一些古老工艺的遗失，而人们内心又渴望那个有着高潮精湛的艺术品。";
        
        
        //回答问题的个数
        LWTextStorage *numStorsge = [self createTextWithTextColor:HWColor(153, 153, 153) andTextFont:14 andFrame:CGRectMake(image.left, detialStorsge.bottom+10, mainQues.width, 30)];
        numStorsge.text = @"102个回答";
        numStorsge.textAlignment = NSTextAlignmentRight;
        self.wdCellHeight = [self suggestHeightWithBottomMargin:10];
        [self addStorage:image];
        
    }
    return self;
}



-(LWTextStorage *)createTextWithTextColor:(UIColor *)color andTextFont:(CGFloat)size andFrame:(CGRect)rect
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.textColor = color;
    text.font = [UIFont systemFontOfSize:size];
    text.frame = rect;
    text.linespacing = 4.0f;
    [self addStorage:text];
    return text;
}


@end
