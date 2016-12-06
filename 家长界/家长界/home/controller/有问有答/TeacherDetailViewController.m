//
//  TeacherDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherDetailViewController.h"

@interface TeacherDetailViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate>

/*头部背景视图*/
@property (nonatomic,strong) UIView *backView;

/*主页headview*/
@property (nonatomic,strong) UIView *headerView;

/*切换按钮*/
@property (nonatomic,strong) UISegmentedControl *segmentControl;

/*底部按钮视图*/
@property (nonatomic,strong) UIView *bottomView;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBar;

/*按钮数组*/
@property (nonatomic,strong) NSArray *seleBarArr;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSString *segStr;

@end

@implementation TeacherDetailViewController
static const int bottomViewHeight = 50;
static const int imgViewHeight = 250;
static const int backViewHeight = 240;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];
    [self.view addSubview:self.bottomView];
    [self createView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.backView addSubview:self.seleBar];
    [self.backView addSubview:self.headerView];
    self.seleBarArr = @[@"主页",@"咨询",@"动态"];
    [self createSeleBarView];
    //self.tableView.allowsSelection = NO;
    
//    self.tableView.estimatedRowHeight = 300;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark -----顶部背景视图-----
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, imgViewHeight)];
        _backView.backgroundColor = HWColor(242, 242, 242);
        TeacherDetailView *vi = [[TeacherDetailView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, backViewHeight)];
        vi.nameLabel.text = @"张老师";
        vi.titleLabel.text = @"资深心理咨询师";
        vi.commentLabel.text = @"88个好评";
        vi.consultLabel.text = @"93人咨询过";
        vi.likeLabel.text = @"452个赞";
        
        [_backView addSubview:vi];
        
    }
    return _backView;
}

#pragma mark ====主页headview====
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.seleBar.y+self.seleBar.height, SCREEN_WIDTH, 420)];
        _headerView.backgroundColor = HWColor(242, 242, 242);
        teacherHeaderView *vi = [[teacherHeaderView alloc]initWithFrame:_headerView.bounds];
        vi.titleLabel.text = @"获得了由美国一个名叫CCI GREENHEART组织授予的“全球领导人会议”奖学金。包括，去华盛顿特区的往返机票500美金，以及去了之后吃喝玩学习的所有花销";
       vi.levelDetailLabel.text = @"国家二级咨询师";
        vi.resumeDetailLabel.text = @"我的性格偏于内向，为人坦率、热情、讲求原则；处事乐观、专心、细致、头脑清醒；富有责任心、乐于助人。我还是一个正直忠诚、勤奋求实的人，会不断追求人格的自我完善；明显的特点是乐观自信、温和获得了由美国一个名叫CCI GREENHEART组织授予的“全球领导人会议”奖学金。包括，去华盛顿特区的往返机票500美金，以及去";
        vi.goodDetailLabel.text = @"俯首甘为孺子牛";
        
        [_headerView addSubview:vi];
    
    }
    return _headerView;
}

#pragma mark ****底部按钮视图****
-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - bottomViewHeight, SCREEN_WIDTH, bottomViewHeight)];
        _bottomView.backgroundColor = [UIColor clearColor];
    }
    return _bottomView;
}

/*选择条的设置*/
-(UIView *)seleBar
{
    if (!_seleBar) {
        _seleBar = [[UIView alloc]initWithFrame:CGRectMake(0, self.backView.y+self.backView.height+3, SCREEN_WIDTH, siftHeight)];
    }
    return _seleBar;
}

/*添加选项栏*/
-(void)createSeleBarView
{
    SGSegmentedControl *segment = [SGSegmentedControl segmentedControlWithFrame:self.seleBar.bounds delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    segment.titleColorStateSelected = HWColor(96, 136, 186);
    segment.indicatorColor = HWColor(96, 136, 186);
    [self.seleBar addSubview:segment];
}

#pragma mark >>>>创建底部按钮<<<<
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

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"主页";
        self.headerView.hidden = NO;
        self.headerView.y = self.seleBar.y+self.seleBar.height;
        self.tableView.tableHeaderView.height = self.seleBar.y+self.seleBar.height+20;
        [self.tableView reloadData];
    }
    else if (index == 1){
        self.segStr = @"咨询";
        self.headerView.hidden = YES;
        self.headerView.y = self.seleBar.y+self.seleBar.height;
        self.tableView.tableHeaderView.height = self.seleBar.y+self.seleBar.height;
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"动态";
        [self.tableView reloadData];
 
    }
}

#pragma mark ++++创建tableview及实现方法++++
-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - bottomViewHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = self.backView;
    _tableView.tableHeaderView.height = self.backView.height+self.seleBar.height+self.headerView.height;
    
    [self.view addSubview:_tableView];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]){
        return 130;
    }
    else if ([self.segStr isEqualToString:@"咨询"]){
       
        return 150;

    }
    return 180;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:@"主页"]) {
        
            teacherHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[teacherHomeTableViewCell alloc]initWithFrame:cell.bounds];
                cell.iconImage.image = [UIImage imageNamed:@"teacherImage"];
                cell.dzImage.image = [UIImage imageNamed:@"good"];
                cell.numOfPeople.text = @"25";
                cell.titleLabel.text = @"taylorzhang";
                cell.timeLabel.text = @"2016-11-23 12:00";
                cell.questionLabel.text = @"谢谢老师，很专业，很有收获，必要时会再咨询,等你发的楼房的离开父母看来谢谢老师，很专业，很有收谢谢老师，很专业，很有收获";
            }
            return cell;
    }
    else if ([self.segStr isEqualToString:@"咨询"]){
        
            teacherCosultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[teacherCosultTableViewCell alloc]initWithFrame:cell.bounds];
                cell.imgView.image = [UIImage imageNamed:@"icon"];
                cell.nameLabel.text = @"taylorzhang";
                cell.numberLabel.text = @"23";
                cell.questionLabel.text = @"如何做出生命中最重要的决定？";
                cell.answerLabel.text = @"发现情况限制隐约显示高度的零表视图单元格的内容视图。我们考虑到意外崩溃,转而使用标准的高度";
            }
            return cell;
    }
    else{

    teacherDynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[teacherDynamicTableViewCell alloc]initWithFrame:cell.bounds];
        cell.imgView.image = [UIImage imageNamed:@"icon"];
        cell.nameLabel.text = @"张老师";
        cell.timeLabel.text = @"2016-11-23";
        cell.phoneLabel.text = @"来自iPhone6";
        cell.dynamicLabel.text = @"下雪后的天空没有雾霾，一片蓝天白云,的纠纷数量的积分魅力的空间 ";
        cell.sendNoLabel.text = @"5万";
        cell.commentNoLabel.text = @"3万";
        cell.praiseNoLabel.text = @"72万";
    }
         return cell;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
