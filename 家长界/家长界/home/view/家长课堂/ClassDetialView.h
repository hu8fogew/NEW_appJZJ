//
//  ClassDetialView.h
//  家长界
//
//  Created by mac on 2016/11/24.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassDetialView : UIView
/*视频描述主标题*/
@property(nonatomic,strong)UILabel *classDescText;

/*评分的星*/
@property(nonatomic,strong)UIView *commentImage;

/*评分*/
@property(nonatomic,strong)UILabel *countLabel;

/*评论条数*/
@property(nonatomic,strong)UILabel *numOfcomment;

/*参加人数*/
@property(nonatomic,strong)UILabel *numOfPerson;

/*视频价格*/
@property(nonatomic,strong)UILabel *priceOfVidio;


@end
