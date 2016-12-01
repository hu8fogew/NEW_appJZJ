//
//  ParentFirstTable.m
//  家长界
//
//  Created by mac on 2016/11/18.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentFirstTable.h"

@interface ParentFirstTable()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *backGroundView;

@end

@implementation ParentFirstTable


-(instancetype)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITableView *tab = [[UITableView alloc]initWithFrame:self.bounds];
        tab.delegate = self;
        tab.dataSource = self;
        self.tableView = tab;
        self.isSelec = NO;
        [self addSubview:tab];
       
    }
    
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
        
        cell.textLabel.text = @"未央区";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    self.isSelec = !self.isSelec;
    NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:@(self.isSelec),@"isSelec", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ParentFirst" object:self userInfo:dict];
    
}

///*添加父视图*/
//-(void)addBackgroundView:(UIView *)superView
//{
//    _backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+siftHeight, SCREEN_WIDTH, SCREEN_HEIGHT-64-siftHeight)];
//    _backGroundView.backgroundColor = [UIColor blackColor];
//    _backGroundView.alpha = 0.4;
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleBtnAction)];
//    [_backGroundView addGestureRecognizer:tap];
//    [superView addSubview:_backGroundView];
//}
//
//-(void)cancleBtnAction
//{
//    [_backGroundView removeFromSuperview];
//    _backGroundView = nil;
//    [UIView animateWithDuration:0.1 animations:^{
//        
//        CGRect sf = self.frame;
//        sf.origin.y = 64+siftHeight+1.5;
//        self.frame = sf;
//        
//    }completion:^(BOOL finished) {
//        [self removeFromSuperview];
//    }];
//}


@end
