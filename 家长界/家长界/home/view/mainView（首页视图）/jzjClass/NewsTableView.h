//
//  NewsTableView.h
//  家长界
//
//  Created by mac on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableView;
@protocol NewsTableViewDelegate <NSObject>

-(void)tableView:(UITableView*)table didSelectRowAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface NewsTableView : UIView

@property(nonatomic,strong)UITableView *newsTableView;
@property(nonatomic,assign)id<NewsTableViewDelegate>delegate;
@end
