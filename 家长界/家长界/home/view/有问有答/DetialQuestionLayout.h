//
//  DetialQuestionLayout.h
//  家长界
//
//  Created by mac on 2016/12/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "LWLayout.h"

@interface DetialQuestionLayout : LWLayout<NSCopying>
//问答页面的头部视图高度
@property (nonatomic,assign) CGFloat headerHeight;
//有问有答的首页问题cell的高度；
@property (nonatomic,assign) CGFloat wdCellHeight;
@property (nonatomic,assign) CGRect lineF;
@property (nonatomic,assign) CGRect lineS;


//问答页面的头布局
-(instancetype)initAnswerQuestion;

//有问有答的首页问题布局
-(instancetype)initQuestionDeatail;

@end
