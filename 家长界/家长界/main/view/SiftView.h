//
//  SiftView.h
//  测试Table
//
//  Created by mac on 2016/12/9.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSDropDownMenu;


@interface SiftView : UIView
@property(nonatomic,strong)JSDropDownMenu *menuView;
-(instancetype)initWithSV:(UIView *)superView;

@end
