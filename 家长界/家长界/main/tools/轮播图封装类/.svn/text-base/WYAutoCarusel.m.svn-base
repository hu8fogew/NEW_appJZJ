//
//  WYAutoCarusel.m
//  WYAutoCarousel
//
//  Created by VYCan1sMajoris on 16/4/15.
//  Copyright © 2016年 VYCan1sMajoris. All rights reserved.
//
//       1群满了
//       欢迎大家加2群交流：295276103
//       不定时更新视频 更有及时资源流出 疑问也可私信博主
//       微博地址：  VYCan1sMajoris
#import "WYAutoCarusel.h"
#import "UIImageView+WebCache.h"

@interface WYAutoCarusel ()<UIScrollViewDelegate>

//定义全局变量
@property(nonatomic,strong)UIScrollView * scrollView;

//页面控制
@property(nonatomic,strong)UIPageControl * pageControl;



@end

@implementation WYAutoCarusel

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)createCaruselWithFrame:(CGRect)rect WithSuperView:(UIView *)superView WithImageUrlArr:(NSArray *)imageUrlArr WithPlaceholderImageName:(NSString *)imageName WithInterval:(NSInteger)interval{

    self.scrollView = [[UIScrollView alloc] initWithFrame:rect];
    
    for (int i = 0; i < imageUrlArr.count + 2; i++) {
        
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        
        if (i == 0) {
            [imageV sd_setImageWithURL:[NSURL URLWithString:[imageUrlArr lastObject]] placeholderImage:[UIImage imageNamed:imageName]];
        }else if (i == imageUrlArr.count + 1){
            [imageV sd_setImageWithURL:[NSURL URLWithString:[imageUrlArr firstObject]] placeholderImage:[UIImage imageNamed:imageName]];
        }else{
            [imageV sd_setImageWithURL:[NSURL URLWithString:imageUrlArr[i - 1]] placeholderImage:[UIImage imageNamed:imageName]];
        }
        
        imageV.tag = 10000 + i;
        
        imageV.userInteractionEnabled = YES;
        
        [imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewGestureAction:)]];
        
        [self.scrollView addSubview:imageV];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (imageUrlArr.count + 2), self.scrollView.frame.size.height);
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    
    self.scrollView.delegate = self;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.pagingEnabled = YES;
    
    [self createTimerWithTimeInterval:interval];
    
    [superView addSubview:self.scrollView];
}

- (void)imageViewGestureAction:(UITapGestureRecognizer *)tap{
    
//    self.imageActionBlock(tap.view.tag - 10000);
    
    [self.delegate pushViewController:tap.view.tag];
}

- (void)createPageControlWithFrame:(CGRect)rect WithSuperView:(UIView *)superView WithPageNum:(NSInteger)pageNum WithCurrentColor:(UIColor *)currentColor WithTintColor:(UIColor *)tintColor{
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:rect];
    
    self.pageControl.currentPageIndicatorTintColor = tintColor;
    
    self.pageControl.pageIndicatorTintColor = currentColor;
    
    self.pageControl.numberOfPages = pageNum;
    
    [superView addSubview:self.pageControl];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"这里开始拖动");
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self.timer setFireDate:[NSDate distantPast]];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.scrollView) {
        NSInteger maxPage = scrollView.contentSize.width / scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
        if (page == 1) {
            
            scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * (maxPage - 1), 0);
            self.pageControl.currentPage = maxPage - 2;
            
        }else if (page == maxPage - 1){
            scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
            self.pageControl.currentPage = 0;
        }else{
            self.pageControl.currentPage = page - 1;
        }
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)createTimerWithTimeInterval:(NSInteger)interval{
    
    self.timer = [[NSTimer alloc] init];
    
    self.timer = [NSTimer timerWithTimeInterval:interval target:self selector:@selector(changePage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)changePage{
    NSInteger maxPage = self.scrollView.contentSize.width / self.scrollView.frame.size.width;
    
    NSInteger page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    if (page == maxPage) {
        page = 0;
    }
    
    page++;
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * page, 0) animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
