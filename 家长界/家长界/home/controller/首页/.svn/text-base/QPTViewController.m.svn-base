//
//  QPTViewController.m
//  家长界
//
//  Created by mac on 2016/11/26.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QPTViewController.h"

@interface QPTViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,SGSegmentedControlDelegate>

/*tableview的创建*/
@property(nonatomic,strong)UITableView *QptTable;

/*tableView的HeaderView*/
@property(nonatomic,strong)UIView *qptHeaderView;

/*tableView的bottomView*/
@property(nonatomic,strong)UIView *qptBottomView;


/*选择按钮视图*/
@property(nonatomic,strong)UIView *selectBtnView;

/*广告视图*/
@property(nonatomic,strong)UIView *adView;

/*筛选条目*/
@property(nonatomic,strong)UIView *siftView;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;

/*选择按钮数组*/
@property(nonatomic,strong)NSMutableArray *seleArr;

@property(nonatomic,copy)NSString *segStr;

/*选择条目*/

@property(nonatomic,strong)SGSegmentedControl *segment;

@end

@implementation QPTViewController

//static const int lunBoViewHeight = SCREEN_HEIGHT/5;

//static const int selectBtnViewHeight = 315;
//
static const int bottomViewHeight = 60;

static const int selectViewHeight = 60;


#pragma mark /*************懒加载**************/

/*轮播*/
-(NSMutableArray *)arrLunBo
{
    if (!_arrLunBo) {
        _arrLunBo = [DataBase addSelecteArray];
        
    }
    return _arrLunBo;
}

/*选择按钮*/
-(NSMutableArray *)seleArr
{
    if (!_seleArr) {
        _seleArr = [DataBase addQptSeleBarArray];
    }
    
    return _seleArr;
}


/*tableView*/
-(UITableView *)QptTable
{
    if (!_QptTable) {
        _QptTable = [[UITableView alloc]initWithFrame:self.view.bounds];
        _QptTable.delegate = self;
        _QptTable.dataSource = self;
        _QptTable.tableHeaderView = self.qptHeaderView;
        _QptTable.tableHeaderView.height = self.siftView.y+self.siftView.height;
        _QptTable.tableFooterView = self.qptBottomView;
        _QptTable.backgroundColor = HWColor(241, 241, 241);
    }
    return _QptTable;
}

/*headerView*/
-(UIView *)qptHeaderView
{
    if (!_qptHeaderView) {
        _qptHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 500)];
        _qptHeaderView.backgroundColor = HWColor(241, 241, 241);
    }
    return _qptHeaderView;
}

/*bottomView*/
-(UIView *)qptBottomView
{
    
    if (!_qptBottomView) {
        _qptBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*2/7)];
     
        _qptBottomView.backgroundColor = HWColor(241, 241, 241);
    }
    return _qptBottomView;
}


/*选择按钮视图*/

-(UIView *)selectBtnView
{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, (SCREEN_WIDTH-20)/2)];
        _selectBtnView.backgroundColor = [UIColor whiteColor];
        [self createSelecteActivityWithArr:self.seleArr];
    }
    return _selectBtnView;
}

/*广告视图*/
-(UIView *)adView
{
    if (!_adView) {
        _adView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.y+self.selectBtnView.height+DistanceForCell, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
        _adView.backgroundColor = HWColor(241, 241, 241);
    }
    return _adView;
}


-(UIView *)siftView
{
    if (!_siftView) {
        _siftView = [[UIView alloc]initWithFrame:CGRectMake(0, self.adView.y+self.adView.height+DistanceForCell, SCREEN_WIDTH, SCREEN_WIDTH/10)];
        _siftView.backgroundColor = [UIColor whiteColor];
        
    }
    return _siftView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"企聘通";
    self.navigationController.navigationBar.backgroundColor = HWColor(245, 245, 245);
    //加载页面
    [self createView];

    self.segStr = @"热门职位";

    NSArray *arr = @[@"热门职位",@"最新兼职",@"每日必读",@"合伙人"];
    [self createSeleBarViewWithArr:arr];
    
}


#pragma mark ／*********加载页面*********／

-(void)createView
{
    
    [self.view addSubview:self.QptTable];
    
    [self.qptHeaderView addSubview:self.selectBtnView];
    [self.qptHeaderView addSubview:self.adView];
    [self.qptHeaderView addSubview:self.siftView];
    //添加轮播
    [self createAdsPageWithArr:self.arrLunBo];
    
    //添加广告视图；
    [self createAdView];
    
    //添加底部视图
    [self addBottomView];
}

#pragma mark  /*************创建底部视图***************/

-(void)addBottomView
{
    UIView *vio = [[UIView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH-20, SCREEN_WIDTH/9)];
    vio.backgroundColor = [UIColor whiteColor];
    vio.layer.cornerRadius = 4;
    [self.qptBottomView addSubview:vio];
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-20)*3/5, vio.height)];
    lb.font = [UIFont systemFontOfSize:18];
    lb.textColor = HWColor(153, 153, 153);
    lb.text = @"更多精彩，进入";
    lb.textAlignment = NSTextAlignmentRight;
    [vio addSubview:lb];
    
    UILabel *blue = [[UILabel alloc]initWithFrame:CGRectMake(lb.x+lb.width, 0, (SCREEN_WIDTH-20)*1/5, vio.height)];
    blue.font = [UIFont systemFontOfSize:18];
    blue.textColor = HWColor(61, 158, 226);
    blue.text = @"全职速聘";
    blue.textAlignment = NSTextAlignmentLeft;

    blue.userInteractionEnabled = YES;
    //
    UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qzspClickGeture)];
    
    [blue addGestureRecognizer:tapgest];
    [vio addSubview:blue];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn setTitleColor:HWColor(61, 158, 226) forState:UIControlStateNormal];
    btn.frame = CGRectMake(blue.x+blue.width, 0, (SCREEN_WIDTH-20)*1/5, vio.height);
    [btn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(btn.height/4, 0, btn.height/4, btn.width*4/5)];
    [btn addTarget:self action:@selector(qzspClick) forControlEvents:UIControlEventTouchUpInside];
    [vio addSubview:btn];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*2/7-SCREEN_WIDTH/8, SCREEN_WIDTH, SCREEN_WIDTH/8)];
    vi.backgroundColor = [UIColor whiteColor];
    
    [self.qptBottomView addSubview:vi];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, bottomViewHeight/3, bottomViewHeight/3, bottomViewHeight/3)];
    image.image = [UIImage imageNamed:@"map_image"];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(image.x+image.width+4, bottomViewHeight/4, SCREEN_WIDTH/2, bottomViewHeight/2)];
    lab.font = [UIFont systemFontOfSize:18];
    lab.textColor = HWColor(51, 51, 51);
    lab.text = @"发现生活圈";
    lab.textAlignment = NSTextAlignmentLeft;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(vi.width-30, vi.height/4, vi.height/2, vi.height/2);
    [button setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(lifeClick) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview: button];
    [vi addSubview:lab];
    [vi addSubview:image];
}

//进入全职速聘
-(void)qzspClick
{
    HWLog(@"全职速聘");
}

-(void)qzspClickGeture
{
    HWLog(@"触摸全职速聘");
}

//进入生活圈
-(void)lifeClick
{
    HWLog(@"生活圈");
}


#pragma mark /***********广告宣传视图************/
-(void)createAdView
{
    /*添加列表按钮*/
    UIView *hv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.adView.height*0.3)];
    hv.backgroundColor = [UIColor whiteColor];
    [self.adView addSubview:hv];
    //第一张图标
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10+hv.height/3, hv.height*2/7, hv.height*3/7, hv.height*3/7)];
    imageView.image = [UIImage imageNamed:@"fire_image"];
    //标题
    UILabel *labF = [[UILabel alloc]initWithFrame:CGRectMake(imageView.x+imageView.width+5, imageView.y, SCREEN_WIDTH/2, imageView.height)];
    labF.font = [UIFont systemFontOfSize:18];
    labF.textColor = HWColor(51, 51, 51);
    labF.text = @"颜值高的都去哪儿了？";
    labF.textAlignment = NSTextAlignmentLeft;
    
    //第二张图标
    
    UIImageView *imageSecond = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*5/6, hv.height/6, SCREEN_WIDTH/12, hv.height*2/3)];
    imageSecond.image = [UIImage imageNamed:@"hot"];
    
    //第三张图标
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"rightImage"] forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(imageSecond.x+imageSecond.width, hv.height/6, imageSecond.width-10, hv.height*2/3);
//    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(hotClickBtn) forControlEvents:UIControlEventTouchUpInside];
    [hv addSubview:btn];
    [hv addSubview:imageSecond];
    [hv addSubview:labF];
    [hv addSubview:imageView];
    
    /*添加广告图片*/
    UIView *bv = [[UIView alloc]initWithFrame:CGRectMake(0, hv.y+hv.height+1.5, SCREEN_WIDTH, self.adView.height-(hv.y+hv.height+1.5))];
    bv.backgroundColor = [UIColor whiteColor];
    [self.adView addSubview:bv];
    //抢通币
    UIButton *btnf = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnf setBackgroundImage:[UIImage imageNamed:@"qptfirstImage"] forState:UIControlStateNormal];
    btnf.frame = CGRectMake(10, bv.height*0.17, (SCREEN_WIDTH-30)/2, bv.height*0.66);
    [btnf addTarget:self action:@selector(adViewClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btnf.tag = 0;
    [bv addSubview:btnf];
    //职位匹配
    UIButton *btns = [UIButton buttonWithType:UIButtonTypeCustom];
    [btns setBackgroundImage:[UIImage imageNamed:@"qptimageSecond"] forState:UIControlStateNormal];
    btns.frame = CGRectMake(20+btnf.width, bv.height*0.17, (SCREEN_WIDTH-30)/2, bv.height*0.66);
    [btns addTarget:self action:@selector(adViewClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btns.tag = 1;
    [bv addSubview:btns];
    
    
}

/*跳转至颜值高的热门功能*/
-(void)hotClickBtn
{
    HWLog(@"热门颜值");
    
}

-(void)adViewClickBtn:(UIButton *)sender
{
    if (sender.tag == 0) {
        
        HWLog(@"0");
    }
    if (sender.tag == 1) {
        
        HWLog(@"1");
    }
    
}



#pragma mark 创建选择栏按钮

/*添加选项栏*/
-(void)createSeleBarViewWithArr:(NSArray *)arrTitle
{
    self.segment = [SGSegmentedControl segmentedControlWithFrame:self.siftView.bounds delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arrTitle];
    self.segment.titleColorStateSelected = HWColor(61, 158, 226);
    self.segment.indicatorColor = HWColor(61, 158, 226);
    [self.siftView addSubview:self.segment];
}


#pragma mark 选择条目列表（热门职位、最新兼职等）
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"热门职位";
        [self.QptTable reloadData];
        
    }
    if (index == 1) {
        HWLog(@"1");
        self.segStr = @"最新兼职";
        [self.QptTable reloadData];
    }
    if (index == 2) {
        HWLog(@"2");
        self.segStr = @"每日必读";
        [self.QptTable reloadData];
    }
    
    if (index == 3) {
        HWLog(@"3");
        self.segStr = @"合伙人";
        [self.QptTable reloadData];
    }
}



#pragma mark /***********选择按钮的创建***********/
/*创建选择按钮*/
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        UIView *vi = [[UIView alloc]init];
        if (i<4) {
            vi.frame = CGRectMake(((SCREEN_WIDTH-20)/4)*i+10, 0, (SCREEN_WIDTH-20)/4, (SCREEN_WIDTH-20)/4);
                }
    
        if(i>3){
            vi.frame = CGRectMake(((SCREEN_WIDTH-20)/4) * (i-4)+10, (SCREEN_WIDTH-20)/4, (SCREEN_WIDTH-20)/4, (SCREEN_WIDTH-20)/4);
            
        }
        vi.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((SCREEN_WIDTH-20)/12, (SCREEN_WIDTH-20)/20, (SCREEN_WIDTH-20)/12, (SCREEN_WIDTH-20)/12)];
        [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSeleceAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = button.width/2;
//        button.layer.masksToBounds =YES;
        button.backgroundColor = [UIColor grayColor];
        button.tag = i;
        [vi addSubview:button];
        //添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (SCREEN_WIDTH-20)*5/32, (SCREEN_WIDTH-20)/4, 20)];
        label.text = dic[@"labTitle"];
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = HWColor(51, 51, 51);
        label.textAlignment = NSTextAlignmentCenter;
        [vi addSubview:label];
        [self.selectBtnView addSubview:vi];
        i++;
    }
}
/*选择器添加的手势实现方法*/
-(void)clickSeleceAction:(UIButton *)sender
{
    if (sender.tag == 0) {
        HWLog(@"0");
        
        YCYMViewController *vc = [[YCYMViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }
   
    if (sender.tag == 1) {
        HWLog(@"1");
        QZSPViewController *vc = [[QZSPViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (sender.tag == 2) {
        HWLog(@"2");
        JZDRViewController *vc = [[JZDRViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (sender.tag == 3) {
        HWLog(@"3");
        HWLYViewController *vc = [[HWLYViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (sender.tag == 4) {
        HWLog(@"4");
    }
    
    if (sender.tag == 5) {
        HWLog(@"5");
    }
    
    if (sender.tag == 6) {
        HWLog(@"6");
    }
    
    if (sender.tag == 7) {
        HWLog(@"7");
    }
   
    
    HWLog(@"%zd",sender.tag);
    
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
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.qptHeaderView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.qptHeaderView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}





#pragma mark   /***********tableView************/
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
    
    HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[HotZWTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, qptZWcellHeight)];
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
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return qptZWcellHeight+DistanceForCell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.5;
}

//tableView的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
