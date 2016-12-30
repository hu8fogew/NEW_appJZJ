//
//  HomeViewController.m
//  家长界
//
//  Created by mac on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource, WYAutoCaruselDelegate>

@property(nonatomic, nonnull,strong)NSMutableArray *imageArr;

@property(nonatomic,strong)NSArray *arrAd;

@property(nonatomic,strong)CCPScrollView *ccScrollView;

@end

@implementation HomeViewController






#pragma mark --------懒加载----------

-(NSArray *)arrAd
{
    if (!_arrAd) {
        _arrAd = [DataBase addAdverArray];
    }
    return _arrAd;
}

-(NSMutableArray *)imageArr
{
    if(!_imageArr)
    {
        _imageArr = [DataBase addSelecteArray];
        
    }
    return _imageArr;
}



/*创建宣传广告的topView*/
-(UIView *)newsTopView
{
    if (!_newsTopView) {
        _newsTopView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 123)];
        _newsTopView.backgroundColor = [UIColor whiteColor];
        
        _ccScrollView = [[CCPScrollView alloc]initWithFrame:CGRectMake(self.topImageView.x+self.topImageView.width, self.topImageView.y, _newsTopView.width-(self.topImageView.x+self.topImageView.width+10), self.topImageView.height)];
//        vc.backgroundColor = [UIColor greenColor];
        _ccScrollView.titleArray = self.arrAd;
        [_newsTopView addSubview:_ccScrollView];
        
    }
    return _newsTopView;
}




-(UIImageView *)topImageView
{
    if(!_topImageView)
    {
        _topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topImageView"]];
        _topImageView.frame = CGRectMake(10, 20, 76, 76);
        _topImageView.backgroundColor = [UIColor yellowColor];
    }
    
    return _topImageView;
}

/*创建宣传广告的bottomView*/
-(UIView *)newsBottomView
{
    if (!_newsBottomView) {
        _newsBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 127, SCREEN_WIDTH, 123)];
        _newsBottomView.backgroundColor = [UIColor whiteColor];
    }
    return _newsBottomView;
}

-(UIImageView *)bottonImageView
{
    if (!_bottonImageView) {
        _bottonImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"newsBottomImage"]];
        _bottonImageView.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, 98);
    }
    return _bottonImageView;
}

/*广告视图*/
-(UIView *)newsView
{
    if (!_newsView) {
        _newsView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight+selecteButtonHeight+DistanceForCell, SCREEN_WIDTH, 250)];
        _newsView.backgroundColor = HWColor(242, 242, 242);
        
    }
    return _newsView;
}

/*vidioView 视频视图*/
-(NewsCellView *)vidioView0
{
    if (!_vidioView0) {
        
        _vidioView0 = [[NewsCellView alloc]initWithFrame:CGRectMake(0, self.newsView.frame.origin.y + self.newsView.frame.size.height + DistanceForCell, SCREEN_WIDTH, 360)];
        _vidioView0.str = @"热门课堂";
//        _vidioView0.selfView = self;
    }
    return _vidioView0;
}

/* vidioView视频视图1*/
-(HeaderView *)vidioView1
{
    if (!_vidioView1) {
        _vidioView1 = [[HeaderView alloc]initWithFrame:CGRectMake(0, self.vidioView0.frame.origin.y + self.vidioView0.frame.size.height +DistanceForCell, SCREEN_WIDTH, 360)];
        _vidioView1.str = @"热门活动";
    }
    return  _vidioView1;
}

/*选择功能视图（家长课堂、有问有答等）*/
-(UIView *)selecteView
{
    if (!_selecteView) {
        _selecteView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, selecteButtonHeight)];
//        _selecteView.backgroundColor = HWColor(242, 242, 242);
        _selecteView.backgroundColor = [UIColor whiteColor];
    }
    return _selecteView;
    
}

/*headerView的初始化*/
-(UIView *)jzjHeaderView
{
    if (!_jzjHeaderView) {
        _jzjHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 925)];
        _jzjHeaderView.backgroundColor = HWColor(242, 242, 242);
        
    }
    return _jzjHeaderView;
}

/*TableView用懒加载实现*/
-(UITableView *)homeTableView
{
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.backgroundColor = HWColor(242, 242, 242);
        _homeTableView.tableHeaderView = self.jzjHeaderView;
        _homeTableView.tableHeaderView.height = self.vidioView1.frame.origin.y+self.vidioView1.frame.size.height;
    
    }
    return _homeTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"家长界";
    /*广告栏*/
    [self createView];
    
    
}


-(void)createView{
    
    [self.view addSubview:self.homeTableView];
    //    [self.headerView addSubview:self.adView];
    [self.jzjHeaderView addSubview:self.selecteView];
    [self.jzjHeaderView addSubview:self.newsView];
    [self.newsView addSubview:self.newsTopView];
    [self.newsView addSubview:self.newsBottomView];
    [self.newsBottomView addSubview:self.bottonImageView];
    [self.newsTopView addSubview:self.topImageView];
    
    [self.ccScrollView clickTitleLabel:^(NSInteger index, NSString *titleString) {
       
        HWLog(@"%zd",index);
        
        AdverViewController *vc = [[AdverViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }];
    
    
    [self.jzjHeaderView addSubview:self.vidioView0];
    [self.jzjHeaderView addSubview:self.vidioView1];
    [self createAdsPageWithArr:self.imageArr];
    [self createSelecteActivityWithArr:self.imageArr];
    [self addObversCenter];
}

#pragma mark 通知中心
-(void)addObversCenter
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(headerViewClick:) name:@"hotWife" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickHotLife:) name:@"hotlife" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickHotClass:) name:@"hotClass" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickHotClassCell:) name:@"hotClassCell" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickNewsScrollViewAction:) name:@"newsTableScrollView" object:nil];
}
/*热门活动中的cell实现的跳转至详情页*/
-(void)headerViewClick:(NSNotificationCenter *)userInfo
{
    QZdetailViewController *vc = [[QZdetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

/*热门活动的列表（跳转至亲自天地的列表页）*/

-(void)clickHotLife:(NSNotificationCenter *)userInfo
{
    QinZiViewController *vc = [[QinZiViewController alloc]init];
    HWLog(@"热门生活====");
    [self.navigationController pushViewController:vc animated:YES];
}


/*热门课程的跳转（跳转至家长课堂的列表页）*/

-(void)clickHotClass:(NSNotificationCenter *)userInfo
{
    ParentListViewController *listVc = [[ParentListViewController alloc]init];
    
    [self.navigationController pushViewController:listVc animated:YES];
    
}

/*热门课程的cell跳转（跳转至家长课堂的播放详情页面）*/

-(void)clickHotClassCell:(NSNotificationCenter *)userInfo
{
    ParentDetialViewController *vc = [[ParentDetialViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

/*广告条目的跳转（跳转至textView的视图）*/

-(void)clickNewsScrollViewAction:(NSNotificationCenter *)userInfo
{
    AdverViewController *adVc = [[AdverViewController alloc]init];
    
    [self.navigationController pushViewController:adVc animated:YES];
    
}

#pragma mark tableView的代理方法实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

/*实现cell 的属性设置与内容加载*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.textLabel.text = @"发现周边教育";
            cell.imageView.image = [UIImage imageNamed:@"mapImage"];
            
        }
        return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
#pragma mark TableView的selected方法实现跳转传值操作
//TableView的selected方法实现跳转传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HWLog(@"附近教育");
    MapTeachViewController *vc = [[MapTeachViewController alloc]init];
    
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
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.jzjHeaderView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.jzjHeaderView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}


#pragma mark 创建家长课堂、有问有答等视图
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    [self.jzjHeaderView addSubview:self.selecteView];
        int i = 0;
        for (NSDictionary *dic in source) {
            
            UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(10+((SCREEN_WIDTH-20)/3.0) * i, 0, (SCREEN_WIDTH-20)/3.0, selecteButtonHeight)];
//            vi.backgroundColor = HWRandomColor;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.backgroundColor = HWRandomColor;
            [button setFrame:CGRectMake(vi.width/3+3, vi.height/6, selecteButtonHeight*1/3, selecteButtonHeight*1/3)];
            button.layer.cornerRadius = selecteButtonHeight*1/6;
            button.layer.masksToBounds = YES;
            [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(SeleceAction:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [vi addSubview:button];
            
            //添加文字
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, button.y+button.height+15, vi.width, 20)];
            label.text = dic[@"labTitle"];
            label.font = [UIFont systemFontOfSize:18];
            label.textColor = HWColor(51, 51, 51);
            label.textAlignment = NSTextAlignmentCenter;
            [vi addSubview:label];
            [self.selecteView addSubview:vi];
           
            i++;
            
    }
    
}
//选择器添加的手势实现方法
-(void)SeleceAction:(UIButton *)sender
{
    if (sender.tag == 0) {
        ParentViewController *pVc = [[ParentViewController alloc]init];
        
        [self.navigationController pushViewController:pVc animated:YES];
    }
    if (sender.tag == 1) {
        WenDaViewController *wVc = [[WenDaViewController alloc]init];
          [self.navigationController pushViewController:wVc animated:YES];
        
    }
    if (sender.tag == 2) {
        QinZiViewController *vc = [[QinZiViewController alloc]init];
        [self.navigationController pushViewController:vc
                                             animated:YES];
    }
    
    
   
    HWLog(@"%zd",sender.tag);
    
}

#pragma mark NewsCellDelegate

/*headerView的内容添加*/
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId" forIndexPath:indexPath];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [button setTitle:@"热门生活" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(clickNewsCellAction) forControlEvents:UIControlEventTouchUpInside];
    button.tintColor = [UIColor blackColor];
    [button setBackgroundImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
    [headerView addSubview:button];
    return headerView;
}


-(void)clickNewsCellAction
{

    HWLog(@"热门课程");
}


#pragma collectionView的代理协议方法的实现
//
//
//
//
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    
//    HWLog(@"%zd",@(indexPath.row).intValue);
//    
//    ParentDetialViewController *vc = [[ParentDetialViewController alloc]init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
