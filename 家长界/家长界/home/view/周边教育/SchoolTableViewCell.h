//
//  SchoolTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolTableViewCell : UITableViewCell


/*logo图片*/
@property(nonatomic,strong)UIImageView *logoView;

/*主标题*/
@property(nonatomic,strong)UILabel *schoolMainLable;

/*副标题*/
@property(nonatomic,strong)UILabel *schoolOtherLabel;

/*教学种类*/
@property(nonatomic,strong)UILabel *schoolKindLabel;

/*标题尾部的图片*/
@property(nonatomic,strong)UIImageView *smallImageView;

/*标题最后边的定位图片*/
@property(nonatomic,strong)UIImageView*mapImageView;

/*标题最后的定位Label*/
@property(nonatomic,strong)UILabel *distanceLabel;

@property(nonatomic,strong)NSArray *array;

/*教育内容的类型（吉他、钢琴、书法等）*/
@property(nonatomic,strong)UIView *schoolKindView;
@end
