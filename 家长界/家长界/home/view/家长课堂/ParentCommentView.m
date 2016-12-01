//
//  ParentCommentView.m
//  家长界
//
//  Created by mac on 2016/11/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentCommentView.h"

@interface ParentCommentView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *vi;
@end

@implementation ParentCommentView

//评论的条目高度
static const int commentViewHeight = 50;

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createTopView];
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.vi.y+self.vi.height, SCREEN_WIDTH, self.height-self.vi.height)];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        
    }
    return self;
}

/*添加按钮图片*/

-(void)createTopView
{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, commentViewHeight)];
    vi.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, vi.height/4+3, vi.height*3/7, vi.height*3/7)];
    imageView.image = [UIImage imageNamed:@"comment"];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(imageView.x+imageView.width+5, 0, SCREEN_WIDTH/6, vi.height)];
    lab.font = [UIFont systemFontOfSize:20];
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.text = @"评论";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(SCREEN_WIDTH*3/4, 0, SCREEN_WIDTH/4, vi.height);
    [btn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(vi.height/4, btn.width*4/7, vi.height/4, 0)];
//    btn setImageEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    [btn setTitle:@"更多评论" forState:UIControlStateNormal];
    [btn setTitleColor:HWColor(161, 161, 161) forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.width /3, 0, btn.width/5)];
    [btn setTintColor:HWColor(161, 161, 161)];
    [btn addTarget:self action:@selector(clickMoreMessage) forControlEvents:UIControlEventTouchUpInside];
    
    [vi addSubview:btn];
    [vi addSubview:lab];
    [vi addSubview:imageView];
    self.vi = vi;
    [self addSubview:vi];
}

#pragma mark 更多评论

-(void)clickMoreMessage{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getMoreComment" object:nil userInfo:nil];
   
    HWLog(@"更多评论");
}
#pragma mark tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.textLabel.text = @"世界上最牛的app";
    }
    
    return cell;
}


@end
