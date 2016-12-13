//
//  TeacherDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TeachOfCompany.h"

@interface TeachOfCompany ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate>

/*头部背景视图*/
@property (nonatomic,strong) UIView *backView;

/*主页headview*/
@property (nonatomic,strong) UIView *headerView;

/*切换按钮*/
@property (nonatomic,strong) SGSegmentedControl *segmentControl;

@property(nonatomic,strong)UIView *SegView;

/*底部按钮视图*/
@property (nonatomic,strong) UIView *bottomView;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBar;

/*按钮数组*/
@property (nonatomic,strong) NSArray *seleBarArr;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSString *segStr;

//相册数组
@property(nonatomic,strong)NSArray *arrayPhoto;
//展示图片的视图
@property(nonatomic,strong)UIView *imageBackView;
@property(nonatomic,strong)UIImageView *backImg;

@end

@implementation TeachOfCompany

//照片个数除以三

NSUInteger photoCount = 1;
NSUInteger photoRow = 1;

int CELL_Height = 0;
int bottomViewHeight = 50;
int imgViewHeight = 250;
int backViewHeight = 240;

id TeachDescCell = nil;

//相册

-(NSArray *)arrayPhoto
{
    if (!_arrayPhoto) {
        _arrayPhoto = [NSArray arrayWithObjects:@"child_icon.jpg",@"zm_icon.jpg",@"child_icon.jpg",@"zm_icon.jpg",@"child_icon.jpg",@"child_icon.jpg",@"zm_icon.jpg", nil];
    }
    
    return _arrayPhoto;
}

//展示图片的视图
-(UIView *)imageBackView
{
    if (!_imageBackView) {
        _imageBackView = [[UIView alloc]initWithFrame:self.view.bounds];
        _imageBackView.backgroundColor = [UIColor blackColor];
        _backImg = [[UIImageView alloc]initWithFrame:CGRectMake(80, 30, SCREEN_WIDTH-60, SCREEN_WIDTH-160)];
        _backImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapImg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelClick:)];
        
        [_backImg addGestureRecognizer:tapImg];
        
        [_imageBackView addSubview:_backImg];
        
    }
    return _imageBackView;
}



//动态监听变化的视图
-(UIView *)SegView
{
    if (!_SegView) {
        _SegView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
        _SegView.backgroundColor = [UIColor whiteColor];
        
    }
    return _SegView;
}

//条件按钮的懒加载
-(SGSegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
        _segmentControl.titleColorStateSelected = HWColor(96, 136, 186);
        _segmentControl.indicatorColor = HWColor(96, 136, 186);
    }
    
    return _segmentControl;
    
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



- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.arrayPhoto.count<3) {
        photoCount = 1;
    }else{
    
        if(self.arrayPhoto.count%3 == 0)
        {
            photoCount = self.arrayPhoto.count/3;
            
        }else
        {
            photoCount = self.arrayPhoto.count/3+1;
            
        }
    }
    
    CELL_Height = 130;
    [self createTableView];
    [self.view addSubview:self.bottomView];
    [self createView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.backView addSubview:self.seleBar];
    [self.backView addSubview:self.headerView];
    self.seleBarArr = @[@"主页",@"相册",@"动态"];
    
    [self.seleBar addSubview:self.segmentControl];
    
    //添加监听对象
    
    [self createViewObserve];
}

#pragma mark   //、、、、、监听TableView的方法；
-(void)createViewObserve
{
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
}

//方法回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    CGFloat contentSize = self.tableView.contentOffset.y;
    
    if (contentSize > imgViewHeight-siftHeight) {
        
        [self.view addSubview:self.SegView];
        
//        self.segmentControl.frame = CGRectMake(0, 0, SCREEN_WIDTH, siftHeight);
        
        [self.SegView addSubview:self.segmentControl];
        
    }
    
    
    if (0<contentSize && contentSize<imgViewHeight-siftHeight) {
        
        
        [self.SegView removeFromSuperview];
        
        [self.seleBar addSubview:self.segmentControl];
       
    }
    
     [self.tableView reloadData];
}


-(void)viewWillDisappear:(BOOL)animated
{
    
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
    
}





/*添加选项栏*/
//-(void)createSeleBarView
//{
//    SGSegmentedControl *segment = [SGSegmentedControl segmentedControlWithFrame:self.seleBar.bounds delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
//    segment.titleColorStateSelected = HWColor(96, 136, 186);
//    segment.indicatorColor = HWColor(96, 136, 186);
//    [self.seleBar addSubview:segment];
//    
//}

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
        self.segStr = @"相册";
        self.headerView.hidden = YES;
        self.headerView.y = self.seleBar.y+self.seleBar.height;
        self.tableView.tableHeaderView.height = self.seleBar.y+self.seleBar.height;
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"动态";
        self.headerView.hidden = YES;
        self.headerView.y = self.seleBar.y+self.seleBar.height;
        self.tableView.tableHeaderView.height = self.seleBar.y+self.seleBar.height;
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
    
    if ([self.segStr isEqualToString:@"相册"]) {
        
        photoRow = 1;
    }
    
    if ([self.segStr isEqualToString:@"主页"]) {
        
        photoRow = 8;
    }
    
    if ([self.segStr isEqualToString:@"动态"]) {
        
        photoRow = 7;
    }
    
    return photoRow;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]){
        CELL_Height = 130;
    }
   if ([self.segStr isEqualToString:@"相册"]){
        
       CELL_Height = SCREEN_WIDTH*photoCount/3;
        
    }
    
    if ([self.segStr isEqualToString:@"动态"]) {
        
        
        CELL_Height = 180;
    }
    return CELL_Height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:@"主页"]) {
        
        teacherHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[teacherHomeTableViewCell alloc]initWithFrame:cell.bounds];
            TeachDescCell = cell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.iconImage.image = [UIImage imageNamed:@"teacherImage"];
            cell.dzImage.image = [UIImage imageNamed:@"good"];
            cell.numOfPeople.text = @"25";
            cell.titleLabel.text = @"taylorzhang";
            cell.timeLabel.text = @"2016-11-23 12:00";
            cell.questionLabel.text = @"谢谢老师，很专业，很有收获，必要时会再咨询,等你发的楼房的离开父母看来谢谢老师，很专业，很有收谢谢老师，很专业，很有收获";
        }
        
    }
    if ([self.segStr isEqualToString:@"相册"]){
        
        PhotoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[PhotoViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CELL_Height)];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.backgroundColor = HWRandomColor;
            TeachDescCell = cell;

/*
            for (int i = 0; i<self.arrayPhoto.count; i++) {
                UIImageView *image = [[UIImageView alloc]init];
                image.userInteractionEnabled = YES;
                UITapGestureRecognizer *tapImg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OpenClick:)];
                [image addGestureRecognizer:tapImg];
                if (i<3) {
                    image.frame = CGRectMake(10+((SCREEN_WIDTH-26)/3)*i+i*3, 0, (SCREEN_WIDTH-26)/3, (SCREEN_WIDTH-26)/3);
                }
                if (i<6 && i>2) {
                    image.frame = CGRectMake(10+((SCREEN_WIDTH-26)/3)*(i-3)+(i-3)*3, (SCREEN_WIDTH-18)/3, (SCREEN_WIDTH-26)/3, (SCREEN_WIDTH-26)/3);
                }
                
                if (i<9 && i>5) {
                    image.frame = CGRectMake(10+((SCREEN_WIDTH-26)/3)*(i-6)+(i-6)*3, (SCREEN_WIDTH-18)*2/3, (SCREEN_WIDTH-26)/3, (SCREEN_WIDTH-26)/3);
                }
                NSString *str = [NSString stringWithFormat:@"%@", self.arrayPhoto[i]];
                image.image = [UIImage imageNamed:str];
            
                [cell addSubview:image];
            }
*/
            NSArray *oriPName = @[
                                  @"https://testapp.gtax.cn/images/2016/08/25/2241c4b32b8445da87532d6044888f3d.jpg",
                                  
                                  @"https://testapp.gtax.cn/images/2016/08/25/0abd8670e96e4357961fab47ba3a1652.jpg",
                                  
                                  @"https://testapp.gtax.cn/images/2016/08/25/5cd8aa1f1b1f4b2db25c51410f473e60.jpg",
                                  
                                  @"https://testapp.gtax.cn/images/2016/08/25/5e8b978854ef4a028d284f6ddc7512e0.jpg",
                                  
                                  @"https://testapp.gtax.cn/images/2016/08/25/03c58da45900428796fafcb3d77b6fad.jpg",
                                  
                                  @"https://testapp.gtax.cn/images/2016/08/25/dbee521788da494683ef336432028d48.jpg",
                                  
                                  @"https://testapp.gtax.cn/images/2016/08/25/4cd95742b6744114ac8fa41a72f83257.jpg",
                                  
                                  ];
//            @"https://testapp.gtax.cn/images/2016/08/25/4d49888355a941cab921c9f1ad118721.jpg",
//            
//            @"https://testapp.gtax.cn/images/2016/08/25/ea6a22e8b4794b9ba63fd6ee587be4d1.jpg"
            cell.picContainerView.picUrlArray = oriPName;
            cell.picContainerView.picOriArray = oriPName;
//            cell.picContainerView.userInteractionEnabled = YES;
        }
    }
    if([self.segStr isEqualToString:@"动态"]){
        
        teacherDynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[teacherDynamicTableViewCell alloc]initWithFrame:cell.bounds];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            TeachDescCell = cell;
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
        
    }
    return TeachDescCell;
}

#pragma mark -----------图片点击事件
//显示

-(void)OpenClick:(UITapGestureRecognizer *)tap
{
    HWLog(@"%@",tap);
}



-(void)cancelClick:(UITapGestureRecognizer *)tap
{
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
