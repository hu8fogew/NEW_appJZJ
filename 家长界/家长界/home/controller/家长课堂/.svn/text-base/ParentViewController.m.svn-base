//
//  HomeViewController.m
//  家长界
//
//  Created by mac on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "HomeViewController.h"

@interface ParentViewController ()<UITableViewDelegate,UITableViewDataSource, WYAutoCaruselDelegate>

@property(nonatomic, strong)NSMutableArray *imgArr;
@property(nonatomic,strong)UIView *bottomView;
@end

@implementation ParentViewController
#pragma mark --------懒加载----------
/*添加轮播图的假数据*/
-(NSMutableArray *)imgArr
{
    if (!_imgArr) {
        _imgArr = [DataBase addSelecteArray];
    }
    
    return _imgArr;
}

/*vidioView 视频视图*/
-(NewsCellView *)vidioView0
{
    if (!_vidioView0) {
        
        _vidioView0 = [[NewsCellView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 360)];
        _vidioView0.str = @"人气排行";
       
        
    }
    
    return _vidioView0;
}

/*添加底部按钮*/
-(UIView *)bottomView
{
    
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.vidioView0.y+self.vidioView0.height+15, SCREEN_WIDTH, 60)];
    }
    return _bottomView;
}

/*headerView的初始化*/
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 925)];
        _headerView.backgroundColor = HWColor(242, 242, 242);
        
    }
    return _headerView;
}

/*TableView用懒加载实现*/
-(UITableView *)parentTableView
{
    if (!_parentTableView) {
        _parentTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        _parentTableView.delegate = self;
        _parentTableView.dataSource = self;
        _parentTableView.backgroundColor = HWColor(242, 242, 242);
        _parentTableView.tableHeaderView = self.headerView;
        _parentTableView.tableHeaderView.height = self.bottomView.frame.origin.y+self.bottomView.frame.size.height;
        
    }
    return _parentTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"家长界";
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    /*广告栏*/
    
    [self.view addSubview:self.parentTableView];
    
    
    [self.headerView addSubview:self.vidioView0];
    //为headerView添加底部的选择按钮（跳入列表中的按钮）
    [self createBottomViewButton];
    [self.headerView addSubview:self.bottomView];
    [self createAdsPageWithArr:self.imgArr];
   
    
    
    
}

-(void)createBottomViewButton
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [button setTitle:@"课程推荐" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(clickNewsCellViewButtonAction) forControlEvents:UIControlEventTouchUpInside];
    button.tintColor = [UIColor blackColor];
    [button setBackgroundImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
    [self.bottomView addSubview:button];
    
}


/*课程推荐的跳转传值的方法*/
-(void)clickNewsCellViewButtonAction
{
    
    HWLog(@"课程推荐");
    ParentListViewController *vc = [[ParentListViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


#pragma mark tableView的代理方法实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

/*实现cell 的属性设置与内容加载*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    ParentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[ParentTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        cell.PimageLogo.image = [UIImage imageNamed:@"classImage"];
        cell.PmainLabel.text = @"初中物理知识点课程";
        cell.Plabel1.text = @"讲师：李翠芝";
        cell.plabel2.text =@"192人观看";
        cell.PkindLabel.text = @"家庭教育";
        cell.priceLable.text = @"¥9.99";
        
        
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ParentCellHeight;
}
#pragma mark TableView的selected方法实现跳转传值操作
//TableView的selected方法实现跳转传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ParentDetialViewController *vc = [[ParentDetialViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
   
}

#pragma mark 轮播图的实现
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"slecteImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(Kwidth-60, 100, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParentDetialViewController *vc = [ParentDetialViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
