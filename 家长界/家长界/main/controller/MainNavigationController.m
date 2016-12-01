//
//  MainNavigationController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

+(void)initialize
{
    //设置整个项目所有的item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置普通状态(选中的状态)
    //key : NS_____AttributeName
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    textAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    //设置未选中的状态
    NSMutableDictionary *disableTextAttrbutes = [NSMutableDictionary dictionary];
    disableTextAttrbutes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    disableTextAttrbutes[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
    [item setTitleTextAttributes:disableTextAttrbutes forState:UIControlStateDisabled];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  重写的目的是：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        //这时候push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /*自动显示和隐藏tabbar*/
        viewController.hidesBottomBarWhenPushed = YES;
        
        /*设置导航栏上面的内容*/
        //设置左边的按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"back" highImage:@"back"];
        
        //设置右边的按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"" highImage:@""];
    }
    
    [super pushViewController:viewController animated:animated];
    
}

-(void)back
{
    
    [self popViewControllerAnimated:YES];
    
}

-(void)more
{
    [self popToRootViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
