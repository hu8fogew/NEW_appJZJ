//
//  TeacherDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeacherDetailViewController.h"
#import "DetialQuestionLayout.h"
#import "ComentLayout.h"
#import "CommentCell.h"
#import "QuestionDescCell.h"
@interface TeacherDetailViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,UIScrollViewDelegate>

/*头部背景视图*/
@property (nonatomic,strong) TeacherDetailView *backView;
@property(nonatomic,strong) TeacherHeaderView *detialView;
/*主页headview*/
@property (nonatomic,strong) UIView *headerView;
@property(nonatomic,strong)UIView *seleView;
/*切换按钮*/
@property (nonatomic,strong) SGSegmentedControl *segment;

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

id DescCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.seleBarArr = @[@"主页",@"咨询",@"动态"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.headerView addSubview:self.backView];
    [self.headerView addSubview:self.seleBar];
    [self.headerView addSubview:self.detialView];
    [self.seleBar addSubview:self.segment];
    [self createView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.segStr = @"主页";
    
}


#pragma mark -----顶部背景视图-----

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.detialView.botoom;
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
    }
    return _tableView;
}

-(UIView *)seleView
{
    if (!_seleView) {
        _seleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
        _seleView.backgroundColor = [UIColor whiteColor];
    }
    return _seleView;
}

-(SGSegmentedControl *)segment
{
    if (!_segment) {
        _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
        _segment.backgroundColor = [UIColor whiteColor];
        _segment.titleColorStateSelected = HWColor(96, 136, 186);
        _segment.indicatorColor = HWColor(96, 136, 186);
    }
    return _segment;
}


-(TeacherDetailView *)backView{
    if (!_backView) {
        _backView = [[TeacherDetailView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
        _backView.nameLabel.text = @"张老师";
        _backView.titleLabel.text = @"资深心理咨询师";
        _backView.commentLabel.text = @"88个好评";
        _backView.consultLabel.text = @"93人咨询过";
        _backView.likeLabel.text = @"452个赞";
        _backView.imgView.image = [UIImage imageNamed:@"cellImage"];
    }
    return _backView;
}
-(TeacherHeaderView *)detialView
{
    if (!_detialView) {
        _detialView =[[TeacherHeaderView alloc]init];
        _detialView.frame = CGRectMake(0, self.seleBar.botoom, SCREEN_WIDTH, _detialView.descViewLayout.descViewHeight);
    }
    return _detialView;
}

#pragma mark ====主页headview====
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.seleBar.y+self.seleBar.height, SCREEN_WIDTH, 700)];
        _headerView.backgroundColor = HWColor(242, 242, 242);
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
        _seleBar = [[UIView alloc]initWithFrame:CGRectMake(0, self.backView.botoom+2, SCREEN_WIDTH, siftHeight+1.5)];
        _seleView.backgroundColor = HWColor(240, 240, 240);
    }
    return _seleBar;
}
#pragma mark --------scrollerViewDeleage
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffset = self.tableView.contentOffset.y;
    if (contentOffset>self.backView.botoom-64) {
        [self.segment removeFromSuperview];
        [self.view addSubview:self.seleView];
        [self.seleView addSubview:self.segment];
        
    }
    
    if (0<=contentOffset && contentOffset<=self.backView.botoom-64) {
        
        [self.seleView removeFromSuperview];
        [self.seleBar addSubview:self.segment];
    }
    
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
        [self.headerView addSubview:self.detialView];
        self.tableView.tableHeaderView.height = self.detialView.botoom+1.5;
        [self.tableView reloadData];
    }
    else if (index == 1){
        self.segStr = @"咨询";
        [self.detialView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBar.botoom;
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"动态";
        [self.detialView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBar.botoom;
        [self.tableView reloadData];
 
    }
}

#pragma mark ++++创建tableview及实现方法++++



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]){
        ComentLayout *lay = [[ComentLayout alloc]initCommentCell];
        return lay.commentHeight+1.5;
    }
    else if ([self.segStr isEqualToString:@"咨询"]){
        DetialQuestionLayout *layout = [[DetialQuestionLayout alloc]initQuestionDeatail];
        return layout.wdCellHeight+2;

    }
    else{
       return 180;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]) {
        NSString *identifier = @"commentId";
        CommentCell *cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        DescCell = cell;
    }
    if ([self.segStr isEqualToString:@"咨询"]){
        NSString *identifier = @"answerId";
        QuestionDescCell *cell = [[QuestionDescCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        DescCell = cell;
        
    }
    if ([self.segStr isEqualToString:@"动态"]){
        teacherDynamicTableViewCell *cell = [[teacherDynamicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lifeId"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        DescCell = cell;
        cell.imgView.image = [UIImage imageNamed:@"teacherImage"];
        cell.nameLabel.text = @"张老师";
        cell.timeLabel.text = @"2016-11-23";
        cell.phoneLabel.text = @"来自iPhone6";
        cell.dynamicLabel.text = @"下雪后的天空没有雾霾，一片蓝天白云,的纠纷数量的积分魅力的空间 ";
        cell.sendNoLabel.text = @"5万";
        cell.praiseImage.image = [UIImage imageNamed:@"good"];
        cell.commentImage.image = [UIImage imageNamed:@"comment_icon"];
        cell.sendImage.image = [UIImage imageNamed:@"relay_icon"];
        cell.commentNoLabel.text = @"3万";
        cell.praiseNoLabel.text = @"72万";
    }
    return DescCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
