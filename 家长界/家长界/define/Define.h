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
#define selecteButtonHeight SCREEN_WIDTH*0.32

/*问题主标题的高度*/
#define quesMainTextView 70

/*企聘通的职位和介绍的cell高度*/
#define qptZWcellHeight SCREEN_WIDTH*0.48

/*兼职的cell高度*/
#define qptJZcellHeight SCREEN_WIDTH*0.35

#define searchViewHeight SCREEN_WIDTH*0.15



//打印NSLog的另一种写法
#ifdef DEBUG // 处于开发阶段
#define HWLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define HWLog(...)
#endif

// RGB颜色
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif /* Define_h */

/**
 *define:获取屏幕的宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 *define:获取屏幕的高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
