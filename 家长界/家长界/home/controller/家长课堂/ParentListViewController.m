//
//  ParentListViewController.m
//  家长界
//
//  Created by mac on 2016/11/17.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentListViewController.h"

@interface ParentListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView *headerView;

@property(nonatomic,strong)UITableView *ListTable;

/*筛选列表一*/
@property(nonatomic,strong)ParentFirstTable *vc;
/*筛选列表二*/
@property(nonatomic,strong)ParentSecondTable *pSecondTable;
/*筛选按钮*/
@property(nonatomic,strong)SiftView *vi;

@property(nonatomic,strong)UIView *backGroundView;


@end

@implementation ParentListViewController
/*顶部的高度*/
//static const int headerHeight = siftHeight;

/*tableView的cell的高度*/
static const int cellHeight = ParentCellHeight;
#pragma mark /*********懒加载********/
/*TableView的headerView*/
-(UIView *)headerView
{
    
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
//        _headerView.backgroundColor = HWColor(217, 217, 217);
        _headerView.backgroundColor = [UIColor redColor];
    }
    
    return _headerView;
}

/*筛选列表*/
-(ParentFirstTable *)vc{
    if (!_vc) {
        _vc = [[ParentFirstTable alloc] init];
        _vc.width = SCREEN_WIDTH;
        _vc.height = SCREEN_HEIGHT/3;
        _vc.backgroundColor = [UIColor whiteColor];
    }
    
    return _vc;
}
/*二级列表*/
-(ParentSecondTable *)pSecondTable
{
    if(!_pSecondTable)
    {
        _pSecondTable = [[ParentSecondTable alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, siftHeight+64+1.5, SCREEN_WIDTH*2/3, SCREEN_HEIGHT/3)];
    }
    return _pSecondTable;
}


-(UIView *)backGroundView
{
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/3+siftHeight+64, SCREEN_WIDTH, SCREEN_HEIGHT*2/3-siftHeight-64)];
        _backGroundView.backgroundColor = [UIColor blackColor];
        _backGroundView.alpha = 0.4;
    }
    return _backGroundView;
}

/*TableView的懒加载*/

-(UITableView *)ListTable
{
    if (!_ListTable) {
        _ListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, siftHeight+64, SCREEN_WIDTH, SCREEN_HEIGHT-siftHeight)];
        _ListTable.delegate = self;
        _ListTable.dataSource = self;
        
//        _ListTable.tableHeaderView = self.headerView;
//        _ListTable.tableHeaderView.height = siftHeight;
    }
    
    return _ListTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"视频列表";
    
    self.navigationController.navigationBar.backgroundColor = HWColor(242, 242, 242);
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.ListTable];
    
    
    
    

    //添加筛选视图
    [self createSiftView];
    
    
    //通知中心
    [self createNotificationCenter];
    
}

/*添加父视图*/
-(void)addBackgroundView:(UIView *)superView
{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.5f];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, siftHeight+64)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/6+siftHeight+64)];
    
    [self.vc.layer addAnimation:animation forKey:@"position"];
    [self.view addSubview:self.vc];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleBtnAction)];
    [self.backGroundView addGestureRecognizer:tap];
    [superView addSubview:self.backGroundView];
}

-(void)cancleBtnAction
{
    self.vi.btnF.selected = NO;
    self.vi.btnS.selected = NO;
    self.vi.btnT.selected = NO;
    [self.backGroundView removeFromSuperview];
    self.backGroundView = nil;
    [UIView animateWithDuration:0.1 animations:^{
        
        CGRect sf = self.vc.frame;
        sf.origin.y = 64+siftHeight+1.5;
        self.vc.frame = sf;
        CGRect sS = self.pSecondTable.frame;
        sS.origin.y = 64+siftHeight+1.5;
        self.pSecondTable.frame = sf;
        
    }completion:^(BOOL finished) {
        [self.vc removeFromSuperview];
    }];
}


#pragma mark 通知中心

-(void)createNotificationCenter
{
    /*学龄段的一级列表的通知*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickCenter:) name:@"ParentFirst" object:nil];
    
}

/*跳转至子列表的通知中心执行方法*/
-(void)clickCenter:(NSNotification *)userInfo
{
    HWLog(@"=======%@",userInfo.userInfo[@"isSelec"]);
//    NSInteger isSelect = userInfo.userInfo[@"isSelec"];
    
    [self.view addSubview:self.pSecondTable];
    
    
}


#pragma mark  筛选条件的按钮执行方法

-(void)createSiftView
{
    NSArray *arr = @[@"学龄段",@"课程类别",@"人气排行"];
    self.vi = [[SiftView alloc]initWithFrame:self.headerView.bounds andArr:arr andAction:@selector(clickBtnSift:) andTaget:self];
    [self.headerView addSubview:self.vi];
}


-(void)clickBtnSift:(UIButton *)sender
{
    
    
    
    sender.selected = !sender.selected;
    
    
    if (sender.tag == 0) {
        self.vi.btnS.selected = NO;
        self.vi.btnT.selected = NO;
        [self addBackgroundView:self.view];
        if (sender.selected == NO) {
            [self cancleBtnAction];
        }
        
    }
    
    if (sender.tag == 1) {
        
        
        self.vi.btnF.selected = NO;
        self.vi.btnT.selected = NO;
      
    }
    
    if (sender.tag == 2) {
        
        
        self.vi.btnS.selected = NO;
        self.vi.btnF.selected = NO;
       
    }
    
    
    
    
}




#pragma mark tableView的代理协议方法

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
    ParentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ParentTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, cellHeight)];
        cell.PimageLogo.image = [UIImage imageNamed:@"classImage"];
        cell.PmainLabel.text = @"初中物理知识点课程";
        cell.Plabel1.text = @"讲师：李翠芝";
        cell.plabel2.text =@"192人观看";
        cell.PkindLabel.text = @"家庭教育";
        cell.priceLable.text = @"¥9.99";
        
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ParentDetialViewController *vc = [[ParentDetialViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return cellHeight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
