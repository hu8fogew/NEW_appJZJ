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

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation MemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"会员中心";
    
    [self createTableView];
    
}

-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.showsVerticalScrollIndicator = NO;
    
    UINib *nib = [UINib nibWithNibName:@"FirstRowTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"FirstRowTableViewCell"];

}
//返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回行数
    NSInteger rows = 0;
    
    //根据不同分组 返回不同行数
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 4;
            break;
        case 2:
            rows = 3;
            break;
        case 3:
            rows = 1;
            break;
        case 4:
            rows = 3;
            break;
        default:
            rows = 1;
            break;
    }
    
    return rows;
    
}
//头视图高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
//脚视图高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5;
}
//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        FirstRowTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"FirstRowTableViewCell" forIndexPath:indexPath];
        firstCell.imgView.image = [UIImage imageNamed:@"owner_normal.png"];
        firstCell.firstLabel.text = @"我爱北京天安门";
        firstCell.secondLabel.text = @"努力，加油";
        firstCell.personLabel.text = @"0";
        firstCell.companyLabel.text = @"0";
        firstCell.personFansLabel.text = @"0";
        firstCell.companyFansLabel.text = @"0";
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        firstCell.personView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickPersonView:)];
        [firstCell.personView addGestureRecognizer:tapGesture1];
        firstCell.personView.layer.borderColor = [[UIColor grayColor]CGColor];
        firstCell.personView.layer.borderWidth = 0.5;
        
        UITapGestureRecognizer *tapGesture2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCompanyView:)];
        [firstCell.companyView addGestureRecognizer:tapGesture2];
        firstCell.companyView.layer.borderColor = [[UIColor grayColor]CGColor];
        firstCell.companyView.layer.borderWidth = 0.5;
        
        UITapGestureRecognizer *tapGesture3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickPersonFansView:)];
        [firstCell.personFansView addGestureRecognizer:tapGesture3];
        firstCell.personFansView.layer.borderWidth = 0.5;
        firstCell.personFansView.layer.borderColor = [[UIColor grayColor]CGColor];
        
        UITapGestureRecognizer *tapGesture4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCompanyFansView:)];
        [firstCell.companyFansView addGestureRecognizer:tapGesture4];
        firstCell.companyFansView.layer.borderWidth = 0.5;
        firstCell.companyFansView.layer.borderColor = [[UIColor grayColor]CGColor];
        return firstCell;
    }
    
    else if (indexPath.section == 1){
          UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"详细资料";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"相册管理";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
 
        }
        else if (indexPath.row == 2){
            cell.textLabel.text = @"有才有貌";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
            
        }
        else{
            cell.textLabel.text = @"实名认证";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
            
        }
        return  cell;
    }
    else if (indexPath.section == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"简历管理";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"我收到的邀请";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
            
        }
    
        else{
            cell.textLabel.text = @"我投递的简历";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
            
        }
        return  cell;
    }
    else if (indexPath.section == 3){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.textLabel.text = @"我的动态";
        cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
        
        return cell;
    }
    else if (indexPath.section == 4){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"我的收益";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"我的通币";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
        }
 
        else{
            cell.textLabel.text = @"结算记录";
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
            
        }
        return  cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.textLabel.text = @"设置";
        cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
        
        return cell;
    }

    return 0;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 130;
    }
    return 50;
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
