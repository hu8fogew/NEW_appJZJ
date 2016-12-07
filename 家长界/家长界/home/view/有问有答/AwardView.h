//
//  AwardView.h
//  家长界
//
//  Created by mac on 2016/12/7.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AwardView : UIView

@property(nonatomic,strong)PlaceholderTextView *awardText;

@property(nonatomic,strong)UIButton *awardBtn;

-(instancetype)initWithFrame:(CGRect)frame andSuperView:(UIView *)sView;

@end
