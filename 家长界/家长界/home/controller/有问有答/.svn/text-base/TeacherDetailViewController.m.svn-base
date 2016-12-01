//
//  TeacherDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherDetailViewController.h"

@interface TeacherDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView *imageBackView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISegmentedControl *segmentControl;
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation TeacherDetailViewController
static const int imgViewHeight = 150;
static const int bottomViewHeight = 50;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self createView];
}

-(UIView *)imageBackView{
    if (!_imageBackView) {
        _imageBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, imgViewHeight)];
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, imgViewHeight);
        imgView.image = [UIImage imageNamed:@"teacher"];
        
        [_imageBackView addSubview:imgView];
        
        
    }
    return _imageBackView;
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - bottomViewHeight, SCREEN_WIDTH, bottomViewHeight)];
    }
    return _bottomView;
}

-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, bottomViewHeight)];
    label.textAlignment = 1;
    label.text = @"评论";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:20];
    label.backgroundColor = HWColor(244, 244, 244);
    [self.bottomView addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = HWColor(30, 172, 223);
    [btn setTitle:@"立即咨询" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"星星"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickConsult) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(SCREEN_WIDTH/3, 0, (SCREEN_WIDTH/3)*2, bottomViewHeight)];
    [self.bottomView addSubview:btn];
}

-(void)clickConsult{
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - bottomViewHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.imageBackView;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
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
