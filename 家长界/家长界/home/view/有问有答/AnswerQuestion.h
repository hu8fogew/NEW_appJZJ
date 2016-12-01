//
//  AnswerQuestion.h
//  家长界
//
//  Created by mac on 2016/11/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerQuestion : UIView

@property(nonatomic,strong)PlaceholderTextView *answerText;

@property(nonatomic,strong)UIButton *commitBtn;
-(instancetype)initWithFrame:(CGRect)frame andSuperView:(UIView *)sView;
@end
