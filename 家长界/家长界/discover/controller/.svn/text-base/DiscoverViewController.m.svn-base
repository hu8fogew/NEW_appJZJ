//
//  DiscoverViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/7.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "DiscoverViewController.h"


@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *titleArray;
@property (strong,nonatomic) NSMutableArray *imgArray;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 //    _titleArray = [[NSMutableArray alloc]initWithObjects:@"朋友动态",@"招聘助手",@"创投地带",@"生活圈",@"抢通币",@"通讯录", nil];
//    _imgArray = [[NSMutableArray alloc]initWithObjects:@"sns_icon_qq.png",@"sns_icon_wechat.png",@"sns_icon_weibo.png",@"sns_icon_5.png",@"sns_icon_6.png",@"sns_icon_8.png", nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTableView];
}

-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回行数
    NSInteger rows =0;
    
    //根据不同分组 返回不同行数
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 2;
            break;
        case 2:
            rows = 2;
            break;
        default:
            rows = 1;
            break;
    }
    
    return rows;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
       }

    if (indexPath.section == 0) {
        
        cell.imageView.image = [UIImage imageNamed:@"sns_icon_qq.png"];
        cell.textLabel.text = @"朋友动态";
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_wechat.png"];
            cell.textLabel.text = @"招聘助手";
        }
        else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_weibo.png"];
            cell.textLabel.text = @"创投地带";
        }
       
    }
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_5.png"];
            cell.textLabel.text = @"生活圈";
            
        }
        else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"sns_icon_6.png"];
            cell.textLabel.text = @"抢通币";
            
        }
       
    }
    else if (indexPath.section == 3) {
        cell.imageView.image = [UIImage imageNamed:@"sns_icon_8.png"];
        cell.textLabel.text = @"通讯录";
    }
    
    return cell;
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
