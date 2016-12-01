//
//  ParentTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParentTableViewCell : UITableViewCell
/*课程推荐的cellimage*/
@property(nonatomic,strong)UIImageView *PimageLogo;
/*主标题*/
@property(nonatomic,strong)UILabel *PmainLabel;

/*副标题*/
@property(nonatomic,strong)UILabel *Plabel1;
@property(nonatomic,strong)UILabel *plabel2;

/*教育类型*/

@property(nonatomic,strong)UILabel *PkindLabel;

/*价格*/
@property(nonatomic,strong)UILabel *priceLable;

//-(instancetype)initWithFrame:(CGRect)frame;
@end
