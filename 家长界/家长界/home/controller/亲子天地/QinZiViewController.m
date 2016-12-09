//
//  QinZiViewController.m
//  家长界
//
//  Created by taylor on 2016/11/17.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QinZiViewController.h"
#import "QZdetailViewController.h"
@interface QinZiViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate>

/*筛选条*/
@property(nonatomic,strong)UIView *headerView;

/*tableView*/
@property(nonatomic,strong)UITableView *Qintable;

/*筛选条*/
@property(nonatomic,strong)UIView *QZSiftView;



/*sift*/
@property(nonatomic,strong)SiftView *sv;
@property(nonatomic,strong)UIView *backgroundSiftView;
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
    //监听tableview的偏移量变化
    [self createObserverObject];
}


#pragma mark /*********监听tableView的头部高度**********/
-(void)createObserverObject
{
    //添加监听者
    [self.Qintable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    
}

//监听的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    CGFloat offset = self.Qintable.contentOffset.y;
    
    if (offset > lunBoheight-64-siftHeight ) {
//        HWLog(@"开始显示");
        [UIView animateWithDuration:0.5 animations:^{
            [self.view addSubview:self.backgroundSiftView];
            
            [self.Qintable reloadData];
            [self.backgroundSiftView addSubview:self.QZSiftView];
        }];
    }
    if ((offset<lunBoheight-64-siftHeight) && (0<=offset)) {
        [UIView animateWithDuration:0.1 animations:^{
            
            [self.backgroundSiftView removeFromSuperview];
            self.backgroundSiftView = nil;
            [self.Qintable reloadData];
        }];
        
    }
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.Qintable removeObserver:self forKeyPath:@"contentOffset"];
}



#pragma mark  筛选条件的按钮执行方法

-(void)createSiftView
{
    NSArray *arr = @[@"区域",@"年龄段",@"主题特色"];
    self.sv = [[SiftView alloc]initWithFrame:self.QZSiftView.bounds andArr:arr andAction:@selector(clickBtnSift:) andTaget:self];
    [self.QZSiftView addSubview:self.sv];
}


-(void)clickBtnSift:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.tag == 0) {
        self.sv.btnS.selected = NO;
        self.sv.btnT.selected = NO;
        
        
    }
    
    if (sender.tag == 1) {
        
        
        self.sv.btnF.selected = NO;
        self.sv.btnT.selected = NO;
        
    }
    
    if (sender.tag == 2) {
        
        
        self.sv.btnS.selected = NO;
        self.sv.btnF.selected = NO;
        
    }
    
    
    
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
