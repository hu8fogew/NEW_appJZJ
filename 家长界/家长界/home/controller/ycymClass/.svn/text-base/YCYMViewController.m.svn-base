//
//  YCYMViewController.m
//  家长界
//
//  Created by mac on 2016/11/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCYMViewController.h"

@interface YCYMViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate>

/*tableView的创建*/
@property(nonatomic,strong)UITableView *ycymTable;

/*headerView的创建*/
@property(nonatomic,strong)UIView *ycymHeaderView;

/*搜索条目*/
@property(nonatomic,strong)UIView *searchView;
@property(nonatomic,strong)QPTSearchView *search;

/*选择条*/
@property(nonatomic,strong)UIView *selectButtonView;

@property(nonatomic,strong)UIButton *btnF;
@property(nonatomic,strong)UIButton *btnS;

/*创建筛选按钮*/

@property(nonatomic,strong)UIView *ycymSiftView;
@property(nonatomic,strong)SiftView *si;
@property(nonatomic,strong)UIView *backgroundSiftView;

/*轮播图的数组*/
@property(nonatomic,strong)NSMutableArray *lunboArr;


@property(nonatomic,copy)NSString *switchString;

@property(nonatomic,strong)NSString *areaStr;

@end

@implementation YCYMViewController
id ycymCell = nil;

#pragma mark /**********懒加载************/

-(UITableView *)ycymTable
{
    if (!_ycymTable) {
        _ycymTable = [[UITableView alloc]initWithFrame:self.view.bounds];
        
        _ycymTable.delegate = self;
        _ycymTable.dataSource = self;
        _ycymTable.tableHeaderView = self.ycymHeaderView;
        _ycymTable.tableHeaderView.height = self.selectButtonView.y+self.selectButtonView.height;
        
    }
    return _ycymTable;
}

//头部视图
-(UIView *)ycymHeaderView
{
    if (!_ycymHeaderView) {
        _ycymHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _ycymHeaderView.backgroundColor = HWColor(111, 222, 111);
    }
    
    return _ycymHeaderView;
    
}

//搜索条目
-(UIView *)searchView
{
    if (!_searchView) {
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, searchViewHeight)];
        _searchView.backgroundColor = [UIColor whiteColor];
        
        _search = [[QPTSearchView alloc]initWithFrame:_searchView.bounds];
        _areaStr = @"西安";
        NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:16],};
        CGSize textSize = [_areaStr boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
        
        _search.areaText.frame = CGRectMake(10, 0, textSize.width, _searchView.height);
        _search.areaText.text = _areaStr;
        
        _search.areaButton.frame = CGRectMake(_search.areaText.x+_search.areaText.width, _searchView.height/3, _searchView.height*1/3, _searchView.height*1/3);
        
        _search.searchText.frame = CGRectMake(_search.areaButton.x+_search.areaButton.width+5, _searchView.height/4, _searchView.width-(_search.areaButton.x+_search.areaButton.width)-15, _searchView.height*1/2);
        
        [_searchView addSubview:_search];
        
    }
    return _searchView;
}

//轮播图数组
-(NSMutableArray *)lunboArr
{
    if (!_lunboArr) {
        _lunboArr = [DataBase addSelecteArray];
    }
    return _lunboArr;
}

/*选择条目*/
-(UIView *)selectButtonView
{
    if (!_selectButtonView) {
        _selectButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.searchView.height+lunBoheight, SCREEN_WIDTH, SCREEN_WIDTH/5)];
        _selectButtonView.backgroundColor = HWColor(241, 241, 241);
    }
    return _selectButtonView;
}

//筛选按钮的添加
-(UIView *)ycymSiftView
{
    if (!_ycymSiftView) {
        _ycymSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight)];
        _ycymSiftView.backgroundColor = [UIColor whiteColor];
        NSArray *arr = @[@"区域",@"职位要求",@"公司要求"];
        self.si = [[SiftView alloc]initWithFrame:_ycymSiftView.bounds andArr:arr andAction:@selector(siftBtnClick:) andTaget:self];
        
        [_ycymSiftView addSubview:self.si];
        
    }
    
    return _ycymSiftView;
}




-(UIButton *)btnF
{
    if (!_btnF) {
        _btnF = [self createBtnWithframe:CGRectMake(10, self.selectButtonView.height/4, (SCREEN_WIDTH-20)/2, self.selectButtonView.height*1/2) andTitle:@"才貌大神" andTag:0];
    }
    return _btnF;
}

-(UIButton *)btnS
{
    if (!_btnS) {
        _btnS = [self createBtnWithframe:CGRectMake(10+(SCREEN_WIDTH-20)/2, self.selectButtonView.height/4, (SCREEN_WIDTH-20)/2, self.selectButtonView.height*1/2) andTitle:@"高薪职位" andTag:1];
    }
    return _btnS;
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
    
    self.navigationItem.title = @"有才有貌";
    self.navigationController.navigationBar.backgroundColor = HWColor(241, 241, 241);
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self createView];
    
    [self createObserverObject];
    
}

#pragma mark /*********监听tableView的头部高度**********/
-(void)createObserverObject
{
    
    [self.ycymTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

//监听的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    CGFloat offset = self.ycymTable.contentOffset.y;
    
    if (offset > 260 ) {
        HWLog(@"开始显示");
        [UIView animateWithDuration:0.1 animations:^{
            [self.view addSubview:self.backgroundSiftView];
            self.backgroundSiftView.backgroundColor = [UIColor grayColor];
            self.ycymTable.y = siftHeight;
            [self.ycymTable reloadData];
            [self.backgroundSiftView addSubview:self.ycymSiftView];
        }];
    }
    if (offset <260) {
        [UIView animateWithDuration:0.1 animations:^{
            
            [self.backgroundSiftView removeFromSuperview];
            self.ycymTable.y = 0;
            [self.ycymTable reloadData];
        }];
        
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.ycymTable removeObserver:self forKeyPath:@"contentOffset"];
}


#pragma mark  /***********筛选栏*************/

-(void)siftBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.tag == 0) {
        
        self.si.btnS.selected = NO;
        self.si.btnT.selected = NO;
        
        
    }
    
    if (sender.tag == 1) {
        self.si.btnF.selected = NO;
        self.si.btnT.selected = NO;
        
        
    }
    
    if (sender.tag == 2) {
        self.si.btnF.selected = NO;
        self.si.btnS.selected = NO;
        
        
    }
    
}


#pragma mark  /*********加载视图*********/
-(void)createView
{
    [self.view addSubview:self.ycymTable];
    
    [self.ycymHeaderView addSubview:self.searchView];
    
   
    
    //添加搜索框
//    [self creatSearchView];
    
    //轮播图
    [self createAdsPageWithArr:self.lunboArr];
    
    //选择按钮
    
    self.switchString = @"才貌大神";
    self.btnF.selected = YES;
    self.btnS.selected = NO;
    [self createSelectView];
    
}


#pragma mark  创建搜索条

-(void)creatSearchView
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn setTitle:@"西安" forState:UIControlStateNormal];
//    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.height/4, 10, btn.height/4, btn.width/3)];
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(btn.height/3, btn.width*2/3, btn.height/3, 10)];
    [btn setTitleColor:HWColor(53, 53, 53) forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, SCREEN_WIDTH/6, self.searchView.height);
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.searchView addSubview:btn];
    
    
}

#pragma mark /************添加选择条目***************/
-(void)createSelectView
{
    
    [self.ycymHeaderView addSubview:self.selectButtonView];
    
    
}

-(UIButton *)createBtnWithframe:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    button.frame = frame;
        [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"blue"] forState:UIControlStateSelected];
    [button setTitleColor:HWColor(51, 51, 51) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    button.layer.cornerRadius = 2;
    
    [button addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectButtonView addSubview:button];
    return button;
}


//选择按钮实现的方法
-(void)selectButtonClick:(UIButton *)sender
{
    
    if (sender.tag == 0) {
        self.btnF.selected = YES;
        self.btnS.selected = NO;
        HWLog(@" 才貌大神");
        self.switchString = @"才貌大神";
        [self.ycymTable reloadData];
        
    }
    
    if (sender.tag == 1) {
        HWLog(@"高薪职位");
        self.btnF.selected = NO;
        self.btnS.selected = YES;
        self.switchString = @"高薪职位";
        [self.ycymTable reloadData];
        
    }
}

#pragma mark /*********轮播图的实现*******/
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"slecteImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, self.searchView.height, SCREEN_WIDTH, lunBoheight) WithSuperView:self.ycymHeaderView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight+self.searchView.height-30, 30, 20) WithSuperView:self.ycymHeaderView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}



#pragma mark /**********tableView的代理协议***********/

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
    
    if ([self.switchString isEqualToString:@"才貌大神"]) {
        
        CMDSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CMDSTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, qptZWcellHeight)];
            ycymCell = cell;
            cell.textLabel.text = @"有才有貌";
            
            cell.hMainImage.image = [UIImage imageNamed:@"ycymHeaderImage"];
            
            cell.zwNameText.text = @"甄瑞芳";
            cell.salaryText.text = @"5-8k";
            cell.zwKindText.text = @"UI设计师";
            cell.vipImage.image = [UIImage imageNamed:@"vip"];
            cell.academicImage.image = [UIImage imageNamed:@"acaImgae"];
            cell.academicText.text = @"本科";
            cell.timeImageView.image = [UIImage imageNamed:@"time_image"];
            cell.timeText.text = @"3-5年";
            cell.mapImageView.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.earaText.text = @"西安高新产业园逸翠园i都会";
            cell.eyeImage.image = [UIImage imageNamed:@"eyeImage"];
            cell.numText.text = @"3288";
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH-20, cell.bottomView.height-10)];
            lab.font = [UIFont systemFontOfSize:14];
            lab.textColor = HWColor(153, 153, 153);
            lab.textAlignment = NSTextAlignmentLeft;
            lab.text = @"我的优势：8年的销售经验，沟通能力强、口齿伶俐、思维敏捷、管理组织能力强";
            lab.numberOfLines = 2;
            [cell.bottomView addSubview:lab];
        
        }
    }
    if ([self.switchString isEqualToString:@"高薪职位"]) {
        
        HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[HotZWTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, qptZWcellHeight)];
            ycymCell = cell;
            cell.hMainImage.image = [UIImage imageNamed:@"qptHeader"];
            
            cell.zwKindText.text = @"中级UI设计师";
            cell.salaryText.text = @"5-8k";
            cell.companyText.text = @"企聘通-西部家联教育有限公司";
            cell.vipImage.image = [UIImage imageNamed:@"vip"];
            cell.academicImage.image = [UIImage imageNamed:@"acaImgae"];
            cell.hyText.text = @"IT软件";
            cell.bigCompanyText.text =@"已上市";
            cell.academicText.text = @"本科";
            cell.timeImageView.image = [UIImage imageNamed:@"time_image"];
            cell.timeText.text = @"3-5年";
            cell.mapImageView.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.earaText.text = @"西安高新产业园逸翠园i都会";
            cell.eyeImage.image = [UIImage imageNamed:@"eyeImage"];
            cell.numText.text = @"3288";
            NSArray *arr = @[@"世界500强",@"西安10强",@"全国20强",@"很强很强"];
            
            for (int i = 0; i<arr.count; i++) {
                
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10+i*(5+cell.bottomView.width/5), cell.bottomView.height/4+2, cell.bottomView.width/5, cell.bottomView.height/2-4)];
                lab.font = [UIFont systemFontOfSize:15];
                lab.textColor = HWColor(31, 199, 193);
                lab.text = arr[i];
                lab.textAlignment = NSTextAlignmentCenter;
                lab.layer.borderColor =[HWColor(31, 199, 193) CGColor];
                lab.layer.borderWidth = 1;
                lab.layer.cornerRadius = 3;
                lab.layer.masksToBounds = YES;
                [cell.bottomView addSubview:lab];
                
            }
            
        }
        
    }
    return ycymCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return qptZWcellHeight+DistanceForCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.5;
}



//点击cell的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    
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
