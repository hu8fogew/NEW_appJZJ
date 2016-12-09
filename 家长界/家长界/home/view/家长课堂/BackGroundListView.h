//
//  BackGroundListView.h
//  家长界
//
//  Created by mac on 2016/12/9.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ParentFirstTable,ParentSecondTable;

@interface BackGroundListView : UIView
@property(nonatomic,strong)ParentFirstTable *Ftable;
@property(nonatomic,strong)ParentSecondTable *Stable;
@property(nonatomic,strong)UIView *backGroundView;
-(instancetype)initWithFrame:(CGRect)frame andSPView:(UIView *)Sv;


@end
