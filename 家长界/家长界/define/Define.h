//
//  Define.h
//  家长界
//
//  Created by mac on 16/11/4.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define Kwidth self.view.frame.size.width
#define Kheight self.view.frame.size.height
#define  NewsPath @"http://c.m.163.com/nc/video/home/%zd-10.html"
/*家长课堂的cell高度*/
#define ParentCellHeight 130
/*cell之间的间距*/
#define DistanceForCell 15
/*筛选条的高度*/
#define siftHeight 45
/*轮播条目的高度*/
#define lunBoheight SCREEN_HEIGHT*0.22
/*选择按钮的一行高度*/
#define selecteButtonHeight SCREEN_WIDTH*0.28

/*问题主标题的高度*/
#define quesMainTextView 70

/*企聘通的职位和介绍的cell高度*/
#define qptZWcellHeight SCREEN_WIDTH*0.48

/*兼职的cell高度*/
#define qptJZcellHeight SCREEN_WIDTH*0.35

#define searchViewHeight SCREEN_WIDTH*0.15

#define marginLRWidth 10

#define playViewHeight 220

//评论中的个人名称的字体大小
#define CommentNameFont [UIFont systemFontOfSize:14]
//问题主标题的大小
#define MainQuestionFont [UIFont systemFontOfSize:17]
//正文的大小
#define MainAnswerFont [UIFont systemFontOfSize:15]
//日期大小
#define dateFont [UIFont systemFontOfSize:13]

//左边边距
#define leftToMargin 10
//顶边距
#define topToMargin 15
//头像大小
#define imageWH 40


//主标题的颜色
#define MainColor HWColor(51.0f, 51.0f, 51.0f)
//父文本颜色
#define SecondTitleColor HWColor(153.0f, 153.0f, 153.0f)

//打印NSLog的另一种写法
#ifdef DEBUG // 处于开发阶段
#define HWLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define HWLog(...)
#endif

// RGB颜色
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define RGB16(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]


//朋友圈
#define kPopViewBGColor HWColor(224.0f, 224.0f, 224.0f)       //collectionView背景颜色
#define kMaskBGColor [HWColor(0, 0, 0) colorWithAlphaComponent:0.5] //遮罩背景颜色
#define kTextColor [UIColor blackColor]
#define kCancelBtnColor HWColor(0.f, 191.0f, 143.f)

// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif /* Define_h */


//导航选中的颜色
#define DSCommonColor [UIColor colorWithRed:254/255.0  green:129/255.0 blue:0 alpha:1.0]


//获取应用
#define KEYWINDOW [UIApplication sharedApplication].keyWindow


#define WeakSelf  __weak __typeof(&*self)weakSelf = self;


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//是否为iOS8及以上系统
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

/**
 *define:获取屏幕的宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 *define:获取屏幕的高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
