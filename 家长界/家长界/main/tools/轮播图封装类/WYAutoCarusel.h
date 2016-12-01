//
//  WYAutoCarusel.h
//  WYAutoCarousel
//
//  Created by VYCan1sMajoris on 16/4/15.
//  Copyright © 2016年 VYCan1sMajoris. All rights reserved.
//       1群满了
//       欢迎大家加2群交流：295276103
//       不定时更新视频 更有及时资源流出 疑问也可私信博主
//       微博地址：  VYCan1sMajoris
/**
 *说明：该demo依赖 SDWebImage 和 AFNetworking 这两个第三方库
 */

#import <UIKit/UIKit.h>

@protocol WYAutoCaruselDelegate <NSObject>

-(void)pushViewController:(NSInteger)tag;

@end

@interface WYAutoCarusel : UIViewController

//起别名
@property(nonatomic,weak)id<WYAutoCaruselDelegate>delegate;

/**
 *时间控制器
 *可以调用该时间控制器来决定是否执行自动轮播
 */
@property(nonatomic,strong)NSTimer * timer;


/** 定义图片点击事件的block */
//@property(nonatomic,copy)void(^imageActionBlock)(NSInteger imageTag);


/**
 *该方法创建scrollView
 *parma: rect scrollView的位置
 *parma: superView 承载scrollView的父视图
 *parma: imageUrlArr 存放网络请求图片地址的数组
 *parma: imageName 占位图的名字
 *parma: interval 轮播时间
 */
- (void)createCaruselWithFrame:(CGRect)rect
                 WithSuperView:(UIView *)superView
               WithImageUrlArr:(NSArray *)imageUrlArr
      WithPlaceholderImageName:(NSString *)imageName
                  WithInterval:(NSInteger)interval;


/**
 *该方法创建pageControl界面控制器
 *parma: rect  规定pageControl的位置
 *parma: superView   承载pageControl的父视图
 *parma: pageNum 设置pageControl的页数，通常情况下是数据源数组的元素个数
 *parma: currentColor 非选中状态页面颜色
 *parma: tintColor 选中状态页面颜色
 */
- (void)createPageControlWithFrame:(CGRect)rect
                     WithSuperView:(UIView *)superView
                       WithPageNum:(NSInteger)pageNum
                  WithCurrentColor:(UIColor *)currentColor
                     WithTintColor:(UIColor *)tintColor;

/**
 *该方法用来创建时间控制器
 *parma: interval 设置页面跳转时间间隔
 */
- (void)createTimerWithTimeInterval:(NSInteger)interval;



@end
