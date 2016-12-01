//
//  NewsTableView.m
//  家长界
//
//  Created by mac on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "NewsTableView.h"
@interface NewsTableView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NewsTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame: frame];
    if (self) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.bounds];
        tableView.delegate = self;
        tableView.dataSource = self;
        self.newsTableView = tableView;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:tableView];
        
        
    }
    
    
    return self;
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
     [tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier"];
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.newsMLableText.text = @"孩子为什么”不合群“？不为人知的背后消息";
    cell.newsDLableText.text = @"让孩子进行户外活动！";
    
    cell.titleImg.image = [UIImage imageNamed:@"tableImage"];
    cell.commentLableText.text = @"0评";
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"newsTableScrollView" object:nil userInfo:nil];
    HWLog(@"只是第%zd行",indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 76;
}



@end
