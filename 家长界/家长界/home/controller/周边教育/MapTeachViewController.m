//
//  MapTeachViewController.m
//  家长界
//
//  Created by mac on 2016/11/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MapTeachViewController.h"

@interface MapTeachViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate>



/* SelecteButtonView选择按钮视图*/

@property(nonatomic,strong)UIView *selecteButtonView;
/*mapViewTableView列表视图*/
@property(nonatomic,strong)UITableView *mapTableView;

/*selecteButtonArray选择按钮的信息数组*/
@property(nonatomic,strong)NSArray *selecteButtonArr;
/*附近的学校*/
@property(nonatomic,strong)UIView *bottomHeaderView;

/*topView顶部视图*/
@property(nonatomic,strong)UIView *headerView;
/*轮播图的假数据*/
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation MapTeachViewController



#pragma mark /***********懒加载************/

-(NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [DataBase addSelecteArray];
    }
    
    return _arr;
    
}

-(NSArray *)selecteButtonArr
{
    
    if (!_selecteButtonArr) {
        _selecteButtonArr = [DataBase addSelecArray];
    }
    return _selecteButtonArr;
}

-(UIView *)selecteButtonView
{
    if (!_selecteButtonView) {
        _selecteButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, selecteButtonHeight*2)];
        _selecteButtonView.backgroundColor = [UIColor whiteColor];
        [self createSelecteActivityWithArr:self.selecteButtonArr];
    }
    
    return _selecteButtonView;
    
}
-(UIView *)bottomHeaderView
{
    
    if (!_bottomHeaderView) {
        _bottomHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selecteButtonView.frame.origin.y +self.selecteButtonView.frame.size.height +10, SCREEN_WIDTH, 60)];
        _bottomHeaderView.backgroundColor = [UIColor whiteColor];
        
        
    }
    return _bottomHeaderView;
}

-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 565)];
        _headerView.backgroundColor = HWColor(242, 242, 242);
    }
    return _headerView;
}

-(UITableView *)mapTableView
{
    if (!_mapTableView) {
        _mapTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _mapTableView.delegate = self;
        _mapTableView.dataSource = self;
        _mapTableView.tableHeaderView = self.headerView;
        _mapTableView.tableHeaderView.height = self.bottomHeaderView.bounds.size.height + self.bottomHeaderView.frame.origin.y;
        
        
    }
    
    
    
    return _mapTableView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"周边教育";

    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}

/*加载页面*/
-(void)createView
{
    [self.view addSubview:self.mapTableView];
    [self.headerView addSubview:self.selecteButtonView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = self.bottomHeaderView.frame;
    [btn setTitle:@"附近学校" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickFuJinAction) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.titleLabel.textColor = [UIColor blackColor];
    [self.headerView addSubview:btn];
    
    [self createAdsPageWithArr:self.arr];
    
}

-(void)clickFuJinAction
{
    
    MapListSchoolViewController *vc = [[MapListSchoolViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    HWLog(@"附近的学校");
    
}

#pragma mark TableView的代理协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idetifier = @"identifier";
    
    SchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (cell == nil) {
        
        cell = [[SchoolTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        
        cell.logoView.image = [UIImage imageNamed:@"schoolLogoImage"];
        cell.schoolMainLable.text = @"渭南市华州区卡乐孚英语屋";
        cell.smallImageView.image = [UIImage imageNamed:@"smallLableImage"];
        cell.schoolKindLabel.text = @"乐器";
        cell.schoolOtherLabel.text = @"陕西省渭南市华州区四季花城向东50米";
        cell.distanceLabel.text = @"2.3km";
        cell.mapImageView.image = [UIImage imageNamed:@"mapImage"];
        
        NSArray *arr = @[@"吉他",@"钢琴",@"书法",@"架子鼓"];
        
        for (int i = 0; i<arr.count; i++) {
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0 + i*(cell.schoolKindView.height+20+5), 1, cell.schoolKindView.height+20, cell.schoolKindView.height-6)];
            label.layer.borderWidth = 1;
            label.layer.borderColor = [HWColor(136, 198, 192) CGColor];
            label.layer.cornerRadius = 3;
            label.layer.masksToBounds = YES;
            label.textColor = HWColor(136, 198, 192);
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = 1;
            label.text = arr[i];
            
            [cell.schoolKindView addSubview:label];
            
        }
        
        
        
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    MapListSchoolViewController *vc = [[MapListSchoolViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

#pragma mark /***********选择按钮的创建***********/
/*创建选择按钮*/
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        UIView *vi = [[UIView alloc]init];
        //        if (i<2) {
        vi.frame = CGRectMake(10+((SCREEN_WIDTH-20)/3.0) * i, 0, (SCREEN_WIDTH-20)/3.0, selecteButtonHeight);
        //        }
        
        if(i>2){
            vi.frame = CGRectMake(10+((SCREEN_WIDTH-20)/3.0) * (i-3), selecteButtonHeight, (SCREEN_WIDTH-20)/3.0, selecteButtonHeight);
            
        }
        vi.backgroundColor = [UIColor whiteColor];
        
        //            vi.backgroundColor = HWRandomColor;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.backgroundColor = HWRandomColor;
        [button setFrame:CGRectMake(vi.width/3+3, vi.height/6, selecteButtonHeight*1/3, selecteButtonHeight*1/3)];
        button.layer.cornerRadius = selecteButtonHeight*1/6;
        button.layer.masksToBounds = YES;
                    [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSeleceAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [vi addSubview:button];
        
        //添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, button.y+button.height+15, vi.width, 20)];
        label.text = dic[@"labTitle"];
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = HWColor(51, 51, 51);
        label.textAlignment = NSTextAlignmentCenter;
        [vi addSubview:label];
        [self.selecteButtonView addSubview:vi];
        i++;
    }
}
/*选择器添加的手势实现方法*/
-(void)clickSeleceAction:(UIButton *)sender
{
    
    MapListSchoolViewController *vc = [[MapListSchoolViewController alloc]init];
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    HWLog(@"%zd",sender.tag);
    
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
