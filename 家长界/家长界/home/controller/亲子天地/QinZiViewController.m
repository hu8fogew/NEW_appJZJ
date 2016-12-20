//
//  QinZiViewController.m
//  家长界
//
//  Created by taylor on 2016/11/17.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QinZiViewController.h"
#import "QZdetailViewController.h"
@interface QinZiViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,UIScrollViewDelegate>

/*筛选条*/
@property(nonatomic,strong)UIView *headerView;

/*tableView*/
@property(nonatomic,strong)UITableView *Qintable;

/*筛选条*/
@property(nonatomic,strong)UIView *QZSiftView;



/*sift*/
@property(nonatomic,strong)SiftView *sv;
@property(nonatomic,strong)UIView *backgroundSiftView;
@property(nonatomic,strong)UIView *backGroundView;
/*轮播图的假数据*/
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation QinZiViewController


#pragma mark /*******懒加载*******/
//假数据
-(NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [DataBase addSelecteArray];
    }
    
    return _arr;
}

//头部视图
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
    }
    
    return _headerView;
}

//筛选条
-(UIView *)QZSiftView
{
    if (!_QZSiftView) {
        _QZSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight)];
//        _QZSiftView.backgroundColor = [UIColor greenColor];
    }
    
    return _QZSiftView;
}

//tableView
-(UITableView *)Qintable
{
    if (!_Qintable) {
        _Qintable = [[UITableView alloc]initWithFrame:self.view.bounds];
        
        _Qintable.delegate = self;
        _Qintable.dataSource =self;
        _Qintable.tableHeaderView = self.headerView;
        _Qintable.tableHeaderView.height =lunBoheight;
    }
    
    return _Qintable;
    
}


-(UIView *)backgroundSiftView
{
    if (!_backgroundSiftView) {
        _backgroundSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
    }
    return _backgroundSiftView;
}


//筛选背景
-(UIView *)backGroundView
{
    if (!_backGroundView) {
        
        _backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+siftHeight, SCREEN_WIDTH, SCREEN_HEIGHT-64-siftHeight)];
        _backGroundView.backgroundColor = [UIColor blackColor];
        _backGroundView.alpha = 0.4;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleBtnAction)];
        [_backGroundView addGestureRecognizer:tap];
        
    }
    
    return _backGroundView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createView];
}

#pragma mark /********加载页面**********/
-(void)createView
{
    
    //添加tableView
    [self.view addSubview:self.Qintable];
    //添加轮播图
    [self createAdsPageWithArr:self.arr];
    //添加筛选条目
    [self createSiftView];
}


#pragma mark /*********scrollViewDelegate监听tableView**********/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.Qintable.contentOffset.y;
    
    if (offset > lunBoheight-64-siftHeight ) {
        [self.view addSubview:self.backgroundSiftView];
        
        [self.Qintable reloadData];
        [self.backgroundSiftView addSubview:self.QZSiftView];
    }
    if ((offset<lunBoheight-64-siftHeight) && (0<=offset)) {
        [self.backgroundSiftView removeFromSuperview];
        self.backgroundSiftView = nil;
        [self.Qintable reloadData];
    }

}


#pragma mark  筛选条件的按钮执行方法

-(void)createSiftView
{
//    NSArray *arr = @[@"区域",@"年龄段",@"主题特色"];
    self.sv = [[SiftView alloc]initWithSV:self.QZSiftView];
    
}


#pragma mark //******背景变成黑色****** /
/*添加父视图*/
-(void)addBackgroundView:(UIView *)superView
{
    _backGroundView = [[UIView alloc]initWithFrame:superView.bounds];
    _backGroundView.backgroundColor = [UIColor blackColor];
    _backGroundView.alpha = 0.4;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleBtnAction)];
    [_backGroundView addGestureRecognizer:tap];
    [superView addSubview:_backGroundView];
}

-(void)cancleBtnAction
{
    [_backGroundView removeFromSuperview];
    _backGroundView = nil;
}



#pragma mark tableViewDelegate协议方法

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
    QZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[QZTableViewCell alloc]initWithFrame:cell.bounds];
        
        cell.qzImageLogo.image = [UIImage imageNamed:@"qzImage"];
        cell.qzMainLabel.text = @"帮孩子塑造乐观积极性格";
        cell.qzLabel.text = @"报名截止：2016-08-26";
        cell.qzNumberOfPerson.text = @"2862人报名";
        NSArray *arr = @[@"加班补助",@"假日带薪"];
        
        for (int i = 0; i<arr.count; i++) {
            UILabel *kindLabel = [[UILabel alloc]initWithFrame:CGRectMake(2+i*(cell.actionKindView.width*2/7 + 15), 4, cell.actionKindView.width*2/5-10, cell.actionKindView.height-8)];
            kindLabel.text = arr[i];
            kindLabel.font = [UIFont systemFontOfSize:13];
            kindLabel.layer.borderColor = [HWColor(146, 210, 205) CGColor];
            kindLabel.textAlignment = 1;
            kindLabel.layer.borderWidth = 1.5;
            kindLabel.textColor = HWColor(146, 210, 205);
            kindLabel.layer.cornerRadius = 3;
            kindLabel.layer.masksToBounds = YES;
            
            [cell.actionKindView addSubview:kindLabel];
            
        }
        
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ParentCellHeight;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    
    QZdetailViewController *vc = [QZdetailViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return DistanceForCell/2;
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
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
