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


/*筛选按钮*/
@property(nonatomic,strong)SiftView *vi;




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
//三级列表
-(SiftView *)vi
{
    
    if (!_vi) {
        _vi = [[SiftView alloc]initWithSV:self.view];
        _vi.backgroundColor = [UIColor whiteColor];
    }
    return _vi;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"视频列表";
    
    [self.navigationItem.leftBarButtonItem setTitle:@"返回"];
    
    self.navigationController.navigationBar.backgroundColor = HWColor(242, 242, 242);
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.ListTable];
    
    
    
    

    //添加筛选视图
    [self createSiftView];
    
    
    //通知中心
    [self createNotificationCenter];
    
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
    
}


#pragma mark  筛选条件的按钮执行方法

-(void)createSiftView
{
//    NSArray *arr = @[@"学龄段",@"课程类别",@"人气排行"];
    self.vi = [[SiftView alloc]initWithSV:self.headerView];
   
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
