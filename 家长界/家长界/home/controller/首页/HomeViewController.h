//
//  HomeViewController.h
//  家长界
//
//  Created by mac on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableView,NewsCellView,HeaderView;
@interface HomeViewController : UIViewController 
/*创建TableView视图*/
@property(nonatomic,strong)UITableView *homeTableView;
/*横向滚动广告*/
//@property(nonatomic,strong)AdvertisingColumn *adView;
/*创建TableView的headerView*/
@property(nonatomic,strong)UIView *jzjHeaderView;

/*创建（家长课堂、有问有答等view）*/
@property(nonatomic,strong)UIView *selecteView;

/*创建宣传广告view*/
@property(nonatomic,strong)UIView *newsView;

/*创建视频选择视图一*/
@property(nonatomic,strong)NewsCellView *vidioView0;

/*创建视频选择视图二*/
@property(nonatomic,strong)HeaderView *vidioView1;
/*创建宣传广告的topView*/
@property(nonatomic,strong)UIView *newsTopView;
@property(nonatomic,strong)UIImageView *topImageView;
/*创建宣传广告的bottomView*/
@property(nonatomic,strong)UIView *newsBottomView;
@property(nonatomic,strong)UIImageView *bottonImageView;









@end
