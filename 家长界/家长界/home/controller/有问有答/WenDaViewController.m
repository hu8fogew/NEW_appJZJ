//
//  WenDaViewController.m
//  家长界
//
//  Created by taylor on 2016/11/18.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "WenDaViewController.h"
#import "QuestionTableViewCell.h"

@interface WenDaViewController ()<UITableViewDataSource,UITableViewDelegate,WYAutoCaruselDelegate>

/*头部视图*/
@property(nonatomic,strong)UIView *wdHeaderView;

/*筛选cell的选择按钮视图*/
@property(nonatomic,strong)UIView *selecteCellView;

/*选择按钮*/
@property(nonatomic,strong)UIView *selectedBtnView;

/*tableView*/
@property(nonatomic,strong)UITableView *wdTableView;

/*选择按钮的数组*/
@property(nonatomic,strong)NSMutableArray *seleArr;

/*选择条目的数组*/
@property(nonatomic,strong)NSArray *seleBarArr;

/*选择性cell的实现筛选条件*/
@property(nonatomic, copy)NSString *cellId;


@end

@implementation WenDaViewController
id selecteCell = nil;

int selectWDcellHeight = 0;

#pragma mark /************懒加载***********/
/*选择按钮的信息数组*/
-(NSMutableArray *)seleArr
{
    if (!_seleArr) {
        _seleArr = [DataBase addSeleBarArray];
    }
    return _seleArr;
}


/*headerView的设置*/

-(UIView *)wdHeaderView
{
    if (!_wdHeaderView) {
        _wdHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 500)];
        _wdHeaderView.backgroundColor = HWColor(241, 241, 241);
    }
    return _wdHeaderView;
}

/*选择按钮的视图设置*/
-(UIView *)selectedBtnView
{
    if (!_selectedBtnView) {
        _selectedBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, selecteButtonHeight)];
        _selectedBtnView.backgroundColor = [UIColor whiteColor];
    }
    
    return _selectedBtnView;
}





/*tableView的懒加载*/

-(UITableView *)wdTableView
{
    if (!_wdTableView) {
        _wdTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _wdTableView.delegate = self;
        _wdTableView.dataSource = self;
        _wdTableView.tableHeaderView = self.wdHeaderView;
        _wdTableView.tableHeaderView.height = self.selecteCellView.y+self.selecteCellView.height;
        _wdTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _wdTableView;
}


-(UIView *)selecteCellView
{
    if (!_selecteCellView) {
        _selecteCellView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectedBtnView.y+self.selectedBtnView.height+DistanceForCell, SCREEN_WIDTH, SCREEN_WIDTH*0.3)];
        _selecteCellView.backgroundColor = [UIColor whiteColor];
    }
    return _selecteCellView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
   //加载页面
    [self loadViewData];
    
    
}
#pragma mark 加载页面

-(void)loadViewData
{
    
    [self.view addSubview:self.wdTableView];
    
    [self createRequireButton];
    [self.wdHeaderView addSubview:self.selectedBtnView];
    [self.wdHeaderView addSubview:self.selecteCellView];
    
    
    self.seleBarArr = @[@"最新问题",@"在线老师"];
    [self createSelecteActivityWithArr:self.seleArr];
    [self createAdsPageWithArr:self.seleArr];
    self.cellId = @"精选问答";
    [self createSelectCellView];
    
}

#pragma mark  /*******创建我来回答悬浮按钮********/
-(void)createRequireButton
{
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*5/6, SCREEN_HEIGHT*8/9, SCREEN_WIDTH/6-10, SCREEN_WIDTH/6-10)];
//    vi.backgroundColor = [UIColor redColor];
    vi.layer.cornerRadius = (SCREEN_WIDTH/6-10)/2;
    vi.layer.masksToBounds = YES;
    UIImageView *image = [[UIImageView alloc]initWithFrame:vi.bounds];
    image.image = [UIImage imageNamed:@"require_image"];
    image.userInteractionEnabled = YES;
    
    [image addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(requireCkickBtn:)]];
    
    
    [vi addSubview:image];
    [self.view addSubview:vi];
    
}

-(void)requireCkickBtn:(UITapGestureRecognizer *)tap
{
    AnswerEidttingView *vc = [[AnswerEidttingView alloc]init];
    
    
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark  /***********添加选择cell的按钮**************/
-(void)createSelectCellView
{
    for (int i = 0; i<2; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10+i*(10+(SCREEN_WIDTH-30)/2), self.selecteCellView.height*0.2, (SCREEN_WIDTH-30)/2, self.selecteCellView.height*0.6);
        btn.tag = i;
        if (btn.tag == 0) {
            [btn setBackgroundImage:[UIImage imageNamed:@"ywydSelectF"] forState:UIControlStateNormal];
        }
        if (btn.tag == 1) {
            [btn setBackgroundImage:[UIImage imageNamed:@"ywydSelectS"] forState:UIControlStateNormal];
        }
        
        [btn addTarget:self action:@selector(selectCellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.selecteCellView addSubview:btn];
        
    }
    
}

/*添加选择cell按钮的切换事件*/

-(void)selectCellBtnClick:(UIButton *)sender
{
    if (sender.tag == 0) {
     
        HWLog(@"精选问答");
        self.cellId = @"精选问答";
        [self.wdTableView reloadData];
    }
    
    if (sender.tag == 1) {
        
        HWLog(@"专家一对一");
        self.cellId = @"专家一对一";
        [self.wdTableView reloadData];
    }
    
    
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
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.wdHeaderView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.wdHeaderView WithPageNum:arr.count WithCurrentColor:HWColor(248, 114, 1) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}

#pragma mark 创建家庭教育、学生烦恼等视图
-(void)createSelecteActivityWithArr:(NSArray *)source
{
    int i = 0;
    for (NSDictionary *dic in source) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(10+((SCREEN_WIDTH-20)/3.0) * i, 0, (SCREEN_WIDTH-20)/3.0, selecteButtonHeight)];
        //            vi.backgroundColor = HWRandomColor;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.backgroundColor = HWRandomColor;
        [button setFrame:CGRectMake(vi.width/3+3, vi.height/6, selecteButtonHeight*1/3, selecteButtonHeight*1/3)];
        button.layer.cornerRadius = selecteButtonHeight*1/6;
        button.layer.masksToBounds = YES;
                    [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(seleceActionClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [vi addSubview:button];
        
        //添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, button.y+button.height+15, vi.width, 20)];
        label.text = dic[@"labTitle"];
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = HWColor(51, 51, 51);
        label.textAlignment = NSTextAlignmentCenter;
        [vi addSubview:label];
        [self.selectedBtnView addSubview:vi];
        i++;
        
    }
    
}
/*选择按的实现方法*/
-(void)seleceActionClick:(UIButton *)sender
{
    if (sender.tag == 0) {
        HWLog(@"=======0");
        self.seleBarArr = @[@"最新问题",@"在线老师"];
//        [self createSeleBarViewWithArr:self.seleBarArr];
    }
    if (sender.tag == 1) {
        HWLog(@"=====1");
        self.seleBarArr = @[@"最新问题",@"推荐老师"];
//        [self createSeleBarViewWithArr:self.seleBarArr];
        [self.wdTableView reloadData];
    }
    
    if (sender.tag == 2) {
        HWLog(@"2");
    }
}





#pragma mark /**********tableViewDelegate&dateSource**********/

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
    if ([self.cellId isEqualToString:@"精选问答"]) {
        
        QuestionDescCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[QuestionDescCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.53)];
            selecteCell = cell;
            cell.quesImage.image = [UIImage imageNamed:@"teacherImage"];
            cell.userNameText.text = @"匿名用户";
            cell.timeText.text = @"6小时前";
            cell.questionText.text = @"孩子不合群，总是喜欢一个人待着怎么办？";
//            cell.descQuesText.text = @"学生";
            NSString *str = @"从业十余年，精通婚姻关系和亲子关系领域，咨询师鲜有的跨界能力，长期活跃于专业和公众领域，创立心理类网络节目《世道胡说》，点击量超过310万，引发公众对心理观念的强烈讨论和关注。以心理专家的身份，参与备受关注的青少年真人秀《变形记》，并写出同名书籍，教导父母面对最头疼的问题";
            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
            NSMutableParagraphStyle *paragraphSytle = [[NSMutableParagraphStyle alloc]init];
            [paragraphSytle setLineSpacing:8];
            [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphSytle range:NSMakeRange(0, [str length])];
            cell.descQuesText.numberOfLines = 3;
            [cell.descQuesText setAttributedText:attributedStr];
            cell.descQuesText.lineBreakMode = UILineBreakModeTailTruncation;
//            [cell.descQuesText sizeToFit];
            
            cell.descQuesText.numberOfLines = 3;
            cell.anserOfNum.text = @"100个回答";
            
            
        }
    }
    if ([self.cellId isEqualToString:@"专家一对一"]) {
    
        TeacherOfDescCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[TeacherOfDescCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.55)];
            selecteCell = cell;
            cell.teacherName.text = @"曹雪芹";
            cell.teachKind.text = @"／家庭教育指导师";
            cell.requireNum.text =@"33";
            cell.peopleText.text = @"人咨询过";
            cell.teacherBackImage.image = [UIImage imageNamed:@"cellImage"];
            cell.mottoText.text = @"老吾老以及人之老，幼吾幼以及人之幼";
            cell.areaText.text = @"西安";
            cell.mapImage.image = [UIImage imageNamed:@"map_image"];
        }
    }
    
       return selecteCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return DistanceForCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.cellId isEqualToString:@"精选问答"]) {
        
        selectWDcellHeight = SCREEN_WIDTH*0.53;
    }
    
    if ([self.cellId isEqualToString:@"专家一对一"]) {
     
        selectWDcellHeight = SCREEN_WIDTH*0.55;
    }
    
    return selectWDcellHeight;
}

/*TableViewcell的点击事件*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([selecteCell isMemberOfClass:[QuestionDescCell class]]) {
        AnswerTeacherQuestion *vc = [[AnswerTeacherQuestion alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if([selecteCell isMemberOfClass:[TeacherOfDescCell class]])
    {
    
        TeacherDetailViewController *teacherVC = [TeacherDetailViewController new];
        [self.navigationController pushViewController:teacherVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
