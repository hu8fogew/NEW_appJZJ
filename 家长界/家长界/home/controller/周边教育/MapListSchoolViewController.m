//
//  MapListSchoolViewController.m
//  家长界
//
//  Created by mac on 2016/11/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MapListSchoolViewController.h"

@interface MapListSchoolViewController ()<UITableViewDelegate,UITableViewDataSource>
/*教育机构区域列表*/
@property(nonatomic,strong)UITableView *mapListTable;
/*头部区域（选择列表项）*/
@property(nonatomic,strong)UIView *listHeaderView;

@property(nonatomic,strong)SiftView *vi;


@end

@implementation MapListSchoolViewController


#pragma mark /****************懒加载************/



-(UIView *)listHeaderView
{
    
    if (!_listHeaderView) {
        _listHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
        
    }
    return _listHeaderView;
}

-(UITableView *)mapListTable
{
    if (!_mapListTable) {
        
        _mapListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+siftHeight, SCREEN_WIDTH, SCREEN_HEIGHT-64-siftHeight)];
        
        _mapListTable.delegate = self;
        _mapListTable.dataSource = self;
        
       
    }
    return _mapListTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"周边教育列表";
    
    
    self.view.backgroundColor = HWColor(242, 242, 242);
    [self createView];
    
}



/*添加视图*/
-(void)createView
{
//    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
//    but.frame =CGRectMake(0,0, 60, 44);
//    [but setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    [but addTarget:self action:@selector(popView:)forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem  *barBut = [[UIBarButtonItem alloc]initWithCustomView:but];
//    self.navigationItem.leftBarButtonItem = barBut;
    
    
    [self.view addSubview:self.listHeaderView];
    [self.view addSubview:self.mapListTable];
    
    NSArray *arr = @[@"区域",@"类别",@"全部"];
    
    self.vi = [[SiftView alloc]initWithFrame:self.listHeaderView.bounds andArr:arr andAction:@selector(clickSiftBtn:) andTaget:self];
    [self.listHeaderView addSubview:self.vi];
}


/*筛选条的点击时间*/

-(void)clickSiftBtn:(UIButton *)sender

{
    sender.selected = !sender.selected;
    if (sender.tag == 0) {
        
        self.vi.btnS.selected = NO;
        self.vi.btnT.selected = NO;
        HWLog(@"0");
    }
    
    if (sender.tag == 1) {
        self.vi.btnF.selected = NO;
        self.vi.btnT.selected = NO;
        HWLog(@"1");
    }
    
    if (sender.tag == 2) {
        self.vi.btnS.selected = NO;
        self.vi.btnF.selected = NO;
        HWLog(@"2");
    }
    
}


-(void)popView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    HWLog(@"未实现回跳至前一个页面");
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
    
    SchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 130;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 3;
}



#pragma mark --------tableView的selected方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TeachOfCompany *vc = [[TeachOfCompany alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
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
