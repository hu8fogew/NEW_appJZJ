//
//  MemberCenterViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MemberCenterViewController.h"
#import "FirstRowTableViewCell.h"

@interface MemberCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
//tableView
@property (strong,nonatomic)UITableView *tableView;

//headerView
@property (strong,nonatomic)UIView *headerView;

//selectedView;
@property (strong,nonatomic)UIView *selecteView;
@property (strong,nonatomic)UILabel *gz_text;
@property (strong,nonatomic)UILabel *fs_text;
@property (strong,nonatomic)UILabel *sc_text;

//OwnerView

@property (strong,nonatomic)UIView *ownerView;

//staticArrayImage&String
@property(nonatomic,nullable,strong)NSArray *StaticArr;

@end

@implementation MemberCenterViewController

#pragma mark =========懒加载

-(NSArray *)StaticArr
{
    if (!_StaticArr) {
        _StaticArr = [OwnerDate staticArrayForOwnerDate];
    }
    return _StaticArr;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.selecteView.y+self.selecteView.height;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = HWColor(241, 241, 241);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

//headerView
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400)];
        _headerView.backgroundColor = [UIColor whiteColor];
        [_headerView addSubview:self.ownerView];
    }
    return _headerView;
}

//OwnerView
-(UIView *)ownerView
{
    if (!_ownerView) {
        _ownerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*2/5)];
        _ownerView.backgroundColor = HWColor(94, 146, 239);
        
        OwnerHeaderView *vi = [[OwnerHeaderView alloc]initWithFrame:_ownerView.bounds];
        vi.ownerImage.image = [UIImage imageNamed:@"require_image"];
        vi.backgroundColor = [UIColor clearColor];
        [_ownerView addSubview:vi];
        
    }
    return _ownerView;
}

//选择按钮
-(UIView *)selecteView
{
    if (!_selecteView) {
        _selecteView = [[UIView alloc]initWithFrame:CGRectMake(0, self.ownerView.y+self.ownerView.height, SCREEN_WIDTH, (SCREEN_WIDTH-40)/4)];
        _selecteView.backgroundColor = [UIColor whiteColor];
        
        for(int i = 0; i<3; i++)
        {
            UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(10+i*((SCREEN_WIDTH-40)/3) + i*10, 0, (SCREEN_WIDTH-40)/3, (SCREEN_WIDTH-40)/4)];
//            vi.backgroundColor = HWRandomColor;
            [_selecteView addSubview:vi];
            if(i == 0){
                _gz_text = [self creatSelecteTextWithFrame:CGRectMake(0, vi.height/6, vi.width, vi.height/3) andSv:vi andText:@"0"];
                UIButton *btnF = [self createSelecteBtnWithFrame:CGRectMake(0, _gz_text.y+_gz_text.height, vi.width, vi.height/3) andTitle:@"关注" andTag:i andSv:vi];
                btnF.backgroundColor = [UIColor whiteColor];
            }
            
            if(i == 1){
                _fs_text = [self creatSelecteTextWithFrame:CGRectMake(0, vi.height/6, vi.width, vi.height/3) andSv:vi andText:@"0"];
                UIButton *btS = [self createSelecteBtnWithFrame:CGRectMake(0, vi.height/6+vi.height/3, vi.width, vi.height/3) andTitle:@"粉丝" andTag:i andSv:vi];
                btS.backgroundColor = [UIColor whiteColor];
            }
            if(i == 2){
                _sc_text = [self creatSelecteTextWithFrame:CGRectMake(0, vi.height/6, vi.width, vi.height/3) andSv:vi andText:@"0"];
                UIButton *btT = [self createSelecteBtnWithFrame:CGRectMake(0, vi.height/6+vi.height/3, vi.width, vi.height/3) andTitle:@"收藏" andTag:i andSv:vi];
                btT.backgroundColor = [UIColor whiteColor];
            }
            
        }
        [self.headerView addSubview:_selecteView];
    }
    return _selecteView;
}
//创建选择按钮的Label；
-(UILabel *)creatSelecteTextWithFrame:(CGRect)frame andSv:(UIView *)sv andText:(NSString *)text
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    lab.textColor = HWColor(80, 80, 80);
    lab.font = [UIFont systemFontOfSize:18];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = text;
    [sv addSubview:lab];
    return lab;
}
//创建选择按钮
-(UIButton *)createSelecteBtnWithFrame:(CGRect)frame andTitle:(NSString *)string andTag:(NSInteger)tag andSv:(UIView *)sv
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:string forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.tag = tag;
    [button setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sv addSubview:button];
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"会员中心";
    
    [self createTableView];
    
}

#pragma mark--------选择按钮的实现方法
-(void)selectBtnClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            HWLog(@"关注");
            break;
        case 1:
            HWLog(@"粉丝");
            break;
        case 2:
            HWLog(@"收藏");
            break;
        default:
            break;
    }
}


-(void)createTableView{
    self.tableView.showsVerticalScrollIndicator = NO;
    UINib *nib = [UINib nibWithNibName:@"FirstRowTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"identifier"];

}
//返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.StaticArr.count;
}
//头视图高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return DistanceForCell;
}
////脚视图高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}
//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstRowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    cell.kindImage.image = [UIImage imageNamed:self.StaticArr[indexPath.row][@"kindImage"]];
    cell.descKind.text = self.StaticArr[indexPath.row][@"kindTitle"];
    return cell;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark -----------TableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            HWLog(@"我的动态");
            break;
        case 1:
            HWLog(@"我的问题");
            break;
        case 2:
            HWLog(@"我的回答");
        {
            MyAnswerController *vc = [[MyAnswerController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
            HWLog(@"我的咨询");
            break;
        case 4:
            HWLog(@"我的报名");
            break;
        default:
            break;
    }
    
    
    
    
}

- (void)clickPersonView:(UITapGestureRecognizer *)gesture {
    HWLog(@"点击关注个人");
}
- (void)clickCompanyView:(UITapGestureRecognizer *)gesture {
    HWLog(@"点击关注企业");
}
- (void)clickPersonFansView:(UITapGestureRecognizer *)gesture {
    HWLog(@"点击个人粉丝");
}
- (void)clickCompanyFansView:(UITapGestureRecognizer *)gesture {
    HWLog(@"点击企业粉丝");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
