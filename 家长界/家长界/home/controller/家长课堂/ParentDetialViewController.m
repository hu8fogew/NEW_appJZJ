//
//  ParentDetialViewController.m
//  家长界
//
//  Created by mac on 2016/11/17.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentDetialViewController.h"

@interface ParentDetialViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,SGSegmentedControlDelegate>
/*tableView的headerView*/
@property(nonatomic,strong)UIView *DetailheaderView;

/*TableView*/
@property(nonatomic,strong)UITableView *DetialTable;

/*选择条的view*/
@property(nonatomic,strong)UIView *segumentView;

/*描述标题的视图*/
@property(nonatomic,strong)UIView *discView;

/*播放视频的视图*/
@property(nonatomic,strong)UIView *playVidioView;
/*底部视图*/
@property(nonatomic,strong)UIView *bottomPriceView;

/*加上介绍条目*/
@property(nonatomic,strong)UIView *descView;

/*创建选择栏*/
@property(nonatomic,strong)SGSegmentedControl *segment;

/*介绍&目录的详情介绍*/

@property(nonatomic,strong)UIView *cacalogView;
@property(nonatomic,strong)UIButton *cacalogBtn;
@property(nonatomic,strong)PlaceholderTextView *textCacalog;

@property(nonatomic,copy)NSString *segStr;

/*播放器*/
@property(nonatomic,strong)XCAVPlayerView *playerView;
@end

@implementation ParentDetialViewController

id allCell = nil;

//头部描述内容的高度
static const int topDiscViewHeight = 110;
//播放器的高度
static const int playViewHeight = 220;
//底部播放、付费的高度
static const int bottomViewHeight = 49;
//左边距
static const int ViewLeftMergin = 10;

int cellHeight = 300;
int count = 0;
#pragma mark /*******懒加载********/

/*headerView*/
-(UIView *)DetailheaderView
{
    if (!_DetailheaderView) {
        _DetailheaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _DetailheaderView.backgroundColor = HWColor(242, 242, 242);
    }
    
    return _DetailheaderView;
    
}

-(UIView *)descView
{
    if (!_descView) {
        _descView = [[UIView alloc]initWithFrame:CGRectMake(0, self.cacalogView.y+self.cacalogView.height + DistanceForCell, SCREEN_WIDTH, 40)];
        _descView.backgroundColor = [UIColor whiteColor];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH/3, _descView.height)];
        lab.font = [UIFont systemFontOfSize:18];
        lab.text = @"讲师介绍";
        lab.textColor = [UIColor blackColor];
        lab.textAlignment = NSTextAlignmentLeft;
        [_descView addSubview:lab];
        
    }
    return _descView;
}

/*目录视图的设置*/
-(UIView *)cacalogView
{
    if(!_cacalogView)
    {
        _cacalogView = [[UIView alloc]initWithFrame:CGRectMake(0, self.segumentView.y+self.segumentView.height+2, SCREEN_WIDTH, 120)];
        
        _cacalogView.backgroundColor = [UIColor whiteColor];
        PlaceholderTextView *textCacalog = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 70)];
        textCacalog.textColor = HWColor(81, 81, 81);
        textCacalog.font = [UIFont systemFontOfSize:16];
        textCacalog.textAlignment = NSTextAlignmentLeft;
        textCacalog.delegate = self;
        textCacalog.editable = NO;
        textCacalog.text = @"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦lalalalalaalalalalla啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦lalalalalaalalalalla啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦lalalalalaalalalalla";
        self.textCacalog = textCacalog;
        [_cacalogView addSubview:textCacalog];
    }
    return _cacalogView;
}

/*选择条目的view*/

-(UIView *)segumentView
{
    if (!_segumentView) {
        _segumentView  = [[UIView alloc]initWithFrame:CGRectMake(0, self.discView.y+self.discView.height+DistanceForCell, SCREEN_WIDTH, siftHeight)];
        _segumentView.backgroundColor = [UIColor whiteColor];
    }
    return _segumentView;
}


/*描述的头部标题*/
-(UIView *)discView
{
    if (!_discView) {
        _discView = [[UIView alloc]initWithFrame:CGRectMake(0, playViewHeight, SCREEN_WIDTH, topDiscViewHeight)];
        _discView.backgroundColor = [UIColor whiteColor];
        
        ClassDetialView *cv = [[ClassDetialView alloc]initWithFrame:self.discView.bounds];
        /*描述标题*/
        cv.classDescText.frame = CGRectMake(ViewLeftMergin, 10, SCREEN_WIDTH-20, cv.height/4);
        
        
        /*评分视图星*/
        cv.commentImage.frame = CGRectMake(cv.classDescText.x, cv.classDescText.y+cv.classDescText.height+6, SCREEN_WIDTH/5, cv.classDescText.height-10);
        
        
        for (int i = 0; i<5; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0+i*cv.commentImage.width/5, 0, cv.commentImage.width/5, cv.commentImage.width/5)];
            imageView.image = [UIImage imageNamed:@"commentImage"];
            
            [cv.commentImage addSubview:imageView];
        }
        
        /*评分*/
        
        cv.countLabel.frame = CGRectMake(cv.commentImage.x+cv.commentImage.width, cv.classDescText.y+cv.classDescText.height+6, cv.commentImage.width*4/7, cv.commentImage.height);
        
        
        
        /*评论人数目*/
        
        cv.numOfcomment.frame = CGRectMake(cv.countLabel.x+cv.countLabel.width*4/3, cv.countLabel.y, SCREEN_WIDTH/5, cv.countLabel.height);
        
        /*参与人数*/
        
        cv.numOfPerson.frame = CGRectMake(cv.numOfcomment.x+cv.numOfcomment.width+cv.countLabel.width/3, cv.countLabel.y, SCREEN_WIDTH/5, cv.countLabel.height);
        /*价格*/
        
        cv.priceOfVidio.frame = CGRectMake(cv.commentImage.x, cv.commentImage.y+cv.commentImage.height+3, SCREEN_WIDTH/5, cv.classDescText.height);
        
        
        [_discView addSubview:cv];
    }
    return _discView;
}

/*评论条目的view*/




/*播放器视图*/
-(UIView *)playVidioView
{
    if (!_playVidioView) {
        
        _playVidioView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, playViewHeight)];
        _playVidioView.backgroundColor = [UIColor whiteColor];
        
        
        
        
    }
    
    return _playVidioView;
    
}


//tableView
-(UITableView *)DetialTable
{
    if (!_DetialTable) {
        _DetialTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-bottomViewHeight)];
        _DetialTable.delegate = self;
        _DetialTable.dataSource = self;
        
        _DetialTable.tableHeaderView = self.DetailheaderView;
        _DetialTable.tableHeaderView.height = self.descView.y+self.descView.height;
        
    }
    
    return _DetialTable;
}

//底部的视图
-(UIView *)bottomPriceView
{
    if (!_bottomPriceView) {
        _bottomPriceView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-bottomViewHeight, SCREEN_WIDTH, bottomViewHeight)];
    }
    return _bottomPriceView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载视图
    [self createView];
    
    self.segStr = @"介绍";
    
    
}








/*加载视图*/
-(void)createView
{
    [self.view addSubview:self.DetialTable];
    
    [self.view addSubview:self.bottomPriceView];
    [self.DetailheaderView addSubview:self.playVidioView];
    [self.DetailheaderView addSubview:self.segumentView];
    [self.DetailheaderView addSubview:self.descView];
    [self.DetailheaderView addSubview:self.discView];
    [self createCacalogView];
    
    //客服
    UIButton *requireBtn = [self createBottomButtonWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*2/5, bottomViewHeight) andTarget:self andImage:@"require" andTitle:@"客服" andBackgroundColor:HWColor(245, 245, 245) andAction:@selector(bottomButtonClick:) andTag:1 andTitleColor:HWColor(128, 128, 128) andTitleEdge:UIEdgeInsetsMake(bottomViewHeight/4, bottomViewHeight*5/9, bottomViewHeight/4, SCREEN_WIDTH*2/21)  andImageEdge:UIEdgeInsetsMake(bottomViewHeight/4, -bottomViewHeight*2/13, bottomViewHeight/4, bottomViewHeight*5/9)];
    requireBtn.tintColor = HWColor(128, 128, 128);
    //播放
    UIButton *playBtn = [self createBottomButtonWithFrame:CGRectMake(SCREEN_WIDTH*2/5, 0, SCREEN_WIDTH*3/5, bottomViewHeight) andTarget:self andImage:@"" andTitle:@"立即播放" andBackgroundColor:HWColor(104, 157, 221) andAction:@selector(bottomButtonClick:) andTag:2 andTitleColor:[UIColor whiteColor] andTitleEdge: UIEdgeInsetsMake(bottomViewHeight/4, SCREEN_WIDTH/5+bottomViewHeight/4, bottomViewHeight/4, SCREEN_WIDTH*2/15) andImageEdge: UIEdgeInsetsMake(bottomViewHeight/4, -SCREEN_WIDTH/5, bottomViewHeight/4, SCREEN_WIDTH/5)];
    [self.bottomPriceView addSubview:requireBtn];
    [self.bottomPriceView addSubview:playBtn];
    /*添加播放器*/
    [self addPlayerVidio];
    
    
    NSArray *titleArr = @[@"介绍",@"目录",@"评价"];
    [self createSeleBarViewWithArr:titleArr];
    
}

/*创建目录视图*/
-(void)createCacalogView
{
    [self.DetailheaderView addSubview:self.cacalogView];
    
    UIButton *cacalogBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cacalogBtn.selected = NO;
    cacalogBtn.backgroundColor = HWColor(245, 245, 245);
    [cacalogBtn setImage:[UIImage imageNamed:@"cacalogdown"] forState:UIControlStateNormal];
    [cacalogBtn setImage:[UIImage imageNamed:@"cacalogup"] forState:UIControlStateSelected];
    [cacalogBtn addTarget:self action:@selector(upAndDownClick:) forControlEvents:UIControlEventTouchUpInside];
    cacalogBtn.frame = CGRectMake(10, self.cacalogView.height-30, SCREEN_WIDTH-20, 20);
    self.cacalogBtn = cacalogBtn;
    [self.cacalogView addSubview:cacalogBtn];
}

/*下拉收起*/

-(void)upAndDownClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    HWLog(@"下拉收起");
    if(sender.selected == YES){
        [UIView animateWithDuration:0.05f animations:^{
            self.cacalogView.height = 150;
            self.descView.y = self.cacalogView.y+self.cacalogView.height+10;
            self.DetialTable.tableHeaderView.height = self.descView.y+self.descView.height;
            self.cacalogBtn.y = self.cacalogView.height-30;
            self.textCacalog.height = self.cacalogView.height-30;
            [self.DetialTable reloadData];
            
        }];
    }
    if (sender.selected == NO) {
        
        self.cacalogView.height = 120;
        self.descView.y = self.cacalogView.y+self.cacalogView.height+10;
        self.DetialTable.tableHeaderView.height = self.descView.y+self.descView.height;
        self.cacalogBtn.y = self.cacalogView.height-30;
        self.textCacalog.height = self.cacalogView.height-30;
        [self.DetialTable reloadData];
        
    }
    
    
    
}




#pragma mark 底部视图客服、立即播放的设置及方法添加

/*添加客服和立即播放按钮*/
-(UIButton *)createBottomButtonWithFrame:(CGRect)frame andTarget:(id)target andImage:(NSString *)image andTitle:(NSString *)title andBackgroundColor:(UIColor *)color andAction:(SEL)action andTag:(NSInteger)tag andTitleColor:(UIColor *)col andTitleEdge:(UIEdgeInsets)titleEdge andImageEdge:(UIEdgeInsets)imageEdge
{
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImageEdgeInsets:imageEdge];
    [btn setTitleEdgeInsets:titleEdge];
    btn.backgroundColor = color;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.tag = tag;
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitleColor:col forState:UIControlStateNormal];
    
    return btn;
}


/*咨询客服&立即播放*/
-(void)bottomButtonClick:(UIButton *)sender
{
    if(sender.tag == 1)
    {
        HWLog(@"客服");
        
    }
    
    if (sender.tag == 2) {
        HWLog(@"立即播放");
        
        [self playClick];
    }
    
    
}




/*添加播放器*/
-(void)addPlayerVidio
{
    [XCAVPlayerView shareManager].playerUrl = [NSURL URLWithString:@"http://mob.qipintong.com/video/haiwenying_v1.mp4"];
    
    [XCAVPlayerView shareManager].videoTitle = @"测试视频";
    [XCAVPlayerView startPlayInSuperView:self.playVidioView];
    
    
}


/*立即观看*/
-(void)playClick
{
    [[XCAVPlayerView shareManager] play];
    HWLog(@"立即播放");
}


-(void)viewWillDisappear:(BOOL)animated
{
    
    [[XCAVPlayerView shareManager] pause];
}



#pragma mark 创建选择栏按钮

/*添加选项栏*/
-(void)createSeleBarViewWithArr:(NSArray *)arrTitle
{
    self.segment = [SGSegmentedControl segmentedControlWithFrame:self.segumentView.bounds delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arrTitle];
    self.segment.titleColorStateSelected = HWColor(96, 136, 186);
    self.segment.indicatorColor = HWColor(96, 136, 186);
    [self.segumentView addSubview:self.segment];
}


#pragma mark 选择条目列表（在线老师、最新问题等）
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"介绍";
        [self upDateView];
        [self.DetialTable reloadData];
        
    }
    if (index == 1) {
        HWLog(@"1");
        self.segStr = @"目录";
        [self upDateView];
        [self.DetialTable reloadData];
    }
    if (index == 2) {
        HWLog(@"2");
        self.segStr = @"评价";
        
        self.cacalogView.hidden = YES;
        self.descView.y = self.segumentView.y+self.segumentView.height +DistanceForCell;
        self.DetialTable.tableHeaderView.height = self.descView.y +self.descView.height;
        [self.DetialTable reloadData];
    }
}

/*恢复*/
-(void)upDateView
{
    self.cacalogView.hidden = NO;
    self.cacalogView.height = 120;
    self.cacalogBtn.selected = NO;
    self.descView.y = self.cacalogView.y+self.cacalogView.height+10;
    self.cacalogBtn.y = self.cacalogView.height-30;
    self.textCacalog.height = self.cacalogView.height-30;
    self.descView.y = self.cacalogView.y+self.cacalogView.height+DistanceForCell;
    self.DetialTable.tableHeaderView.height = self.descView.y+self.descView.height;
    
    
}


#pragma mark tableView的代理协议

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if ([self.segStr isEqualToString:@"介绍"]) {
        count = 1;
    }
    if ([self.segStr isEqualToString:@"目录"]) {
        count = 1;
    }
    if ([self.segStr isEqualToString:@"评价"]) {
        count = 5;
    }
    return count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"identifier";
    
    if ([self.segStr isEqualToString:@"介绍"] || [self.segStr isEqualToString:@"目录"]) {
        
        DescTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[DescTeacherCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, cellHeight+50)];
            cell.teacherHeaderImage.image = [UIImage imageNamed:@"teacherImage"];
            cell.descTeacherName.text = @"张宇杰";
            cell.descKind.text = @"资深心理咨询师";
            NSString *str = @"从业十余年，精通婚姻关系和亲子关系领域，咨询师鲜有的跨界能力，长期活跃于专业和公众领域，创立心理类网络节目《世道胡说》，点击量超过310万，引发公众对心理观念的强烈讨论和关注。以心理专家的身份，参与备受关注的青少年真人秀《变形记》，并写出同名书籍，教导父母面对最头疼的问题";
            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
            NSMutableParagraphStyle *paragraphSytle = [[NSMutableParagraphStyle alloc]init];
            [paragraphSytle setLineSpacing:8];
            [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphSytle range:NSMakeRange(0, [str length])];
            [cell.descDetialLabel setAttributedText:attributedStr];
            [cell.descDetialLabel sizeToFit];
            allCell = cell;
            
        }
    }
    if ([self.segStr isEqualToString:@"评价"]) {
        
        ParentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[ParentTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, cellHeight)];
            cell.PimageLogo.image = [UIImage imageNamed:@"classImage"];
            cell.PmainLabel.text = @"初中物理知识点课程";
            cell.Plabel1.text = @"讲师：李翠芝";
            cell.plabel2.text =@"192人观看";
            cell.PkindLabel.text = @"家庭教育";
            cell.priceLable.text = @"¥9.99";
            allCell = cell;
            
        }
        
    }
    
    return allCell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.segStr isEqualToString:@"介绍"] || [self.segStr isEqualToString:@"目录"])
    {
        cellHeight = 300;
    }
    if([self.segStr isEqualToString:@"评价"])
    {
        cellHeight = 100;
    }
    return cellHeight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
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
