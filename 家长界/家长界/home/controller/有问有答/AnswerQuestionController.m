//
//  AnswerQuestionController.m
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerQuestionController.h"
#import "LWImageBrowser.h"
#import "AnswerQuestionCell.h"
#import "AnswerModel.h"
#import "AnswerCellLayout.h"
#import "LWAlertView.h"
@interface AnswerQuestionController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray* fakeDatasource;
/*回答问题的视图*/
@property(nonatomic,strong)UIView *answerView;
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) NSMutableArray* dataSource;
@property (nonatomic,assign,getter = isNeedRefresh) BOOL needRefresh;
@end

const CGFloat RefreshBoundary = 170.0f;

@implementation AnswerQuestionController
#pragma mark - ViewControllerLifeCycle

- (void)loadView {
    [super loadView];
    [self setup];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.answerView];
    //通知中心
    [self createNotifictionCenter];
}

#pragma mark 添加通知中心
-(void)createNotifictionCenter
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickTextForNil) name:@"textFornil" object:nil];
    
}


/*通知中心执行弹出提示内容为空*/
-(void)clickTextForNil
{
    UIAlertController *alertLength = [UIAlertController alertControllerWithTitle:@"提示" message:@"你输入的信息为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *suer = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertLength addAction:suer];
    [self presentViewController:alertLength animated:YES completion:nil];
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.isNeedRefresh) {
        [self refreshBegin];
    }
}

#pragma mark  /*******创建我来回答悬浮按钮********/
-(void)requireCkickBtn:(UITapGestureRecognizer *)tap
{
    AnswerQuestion *answer = [[AnswerQuestion alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*2/3, SCREEN_WIDTH, SCREEN_HEIGHT/3)andSuperView:self.view];
    answer.answerText.frame = CGRectMake(20, 30, answer.width-40, answer.height*2/3-15);
    
    answer.commitBtn.frame = CGRectMake(answer.width-70, answer.height-40, 60, 30);
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnswerCellLayout* layout = self.dataSource[indexPath.row];
    return layout.cellHeight+2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cellIdentifier";
    AnswerQuestionCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[AnswerQuestionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [self confirgueCell:cell atIndexPath:indexPath];
    return cell;
}



- (void)confirgueCell:(AnswerQuestionCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexPath;
    AnswerCellLayout* cellLayout = self.dataSource[indexPath.row];
    cell.cellLayout = cellLayout;
    [self callbackWithCell:cell];
}

- (void)callbackWithCell:(AnswerQuestionCell *)cell {
    
    __weak typeof(self) weakSelf = self;
    //点赞
    cell.clickedEnjoyBtn = ^(AnswerQuestionCell *cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself clickedEnjoyButtonWithCell:cell];
    };
    //打赏
    cell.clickedLikeBtn = ^(AnswerQuestionCell *cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself clickedLickButtonWithCell:cell];
    };
    //展开
    cell.clickedOpenCellCallback = ^(AnswerQuestionCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself openTableViewCell:cell];
    };
    //收起
    cell.clickedCloseCellCallback = ^(AnswerQuestionCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself closeTableViewCell:cell];
    };
    //点击头像
    cell.clickedAvatarCallback = ^(AnswerQuestionCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself showAvatarWithCell:cell];
    };
}

#pragma mark - Actions
//开始评论
- (void)commentWithCell:(AnswerQuestionCell *)cell  {
    
}



//查看头像
- (void)showAvatarWithCell:(AnswerQuestionCell *)cell {
    [LWAlertView shoWithMessage:[NSString stringWithFormat:@"点击了头像:%@",cell.cellLayout.statusModel.name]];
}


/* 由于是异步绘制，而且为了减少View的层级，整个显示内容都是在同一个UIView上面，所以会在刷新的时候闪一下，这里可以先把原先Cell的内容截图覆盖在Cell上，
 延迟0.25s后待刷新完成后，再将这个截图从Cell上移除 */
- (void)coverScreenshotAndDelayRemoveWithCell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight {
    
    UIImage* screenshot = [GallopUtils screenshotFromView:cell];
    
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:[self.tableView convertRect:cell.frame toView:self.tableView]];
    
    imgView.frame = CGRectMake(imgView.frame.origin.x,
                               imgView.frame.origin.y,
                               imgView.frame.size.width,
                               cellHeight);
    
    imgView.contentMode = UIViewContentModeTop;
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.image = screenshot;
    [self.tableView addSubview:imgView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imgView removeFromSuperview];
    });
    
}

//点赞
-(void)clickedEnjoyButtonWithCell:(AnswerQuestionCell *)cell
{
    NSLog(@"我要点赞");
    
}
//打赏
-(void)clickedLickButtonWithCell:(AnswerQuestionCell *)cell
{
    HWLog(@"打赏");
    AwardView *answer = [[AwardView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*2/3, SCREEN_WIDTH, SCREEN_HEIGHT/3)andSuperView:self.view];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, 50, 40)];
    lab.backgroundColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:18];
    lab.textAlignment = NSTextAlignmentRight;
    lab.textColor = HWColor(153, 153, 153);
    lab.text = @"通币";
    [answer addSubview:lab];
    answer.awardText.frame = CGRectMake(lab.x+lab.width, lab.y, answer.width-lab.width-lab.x-10, answer.height*1/5);
    answer.awardBtn.frame = CGRectMake(0, answer.awardText.y+answer.awardText.height+30 ,answer.width , 50);
    
}

//展开Cell
- (void)openTableViewCell:(AnswerQuestionCell *)cell {
    AnswerCellLayout* layout =  [self.dataSource objectAtIndex:cell.indexPath.row];
    AnswerModel* model = layout.statusModel;
    AnswerCellLayout* newLayout = [[AnswerCellLayout alloc] initContentOpendLayoutWithStatusModel:model
                                                                                index:cell.indexPath.row
                                                                        dateFormatter:self.dateFormatter];
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
    [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:newLayout];
    [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath]
                          withRowAnimation:UITableViewRowAnimationNone];
}

//折叠Cell
- (void)closeTableViewCell:(AnswerQuestionCell *)cell {
    AnswerCellLayout* layout =  [self.dataSource objectAtIndex:cell.indexPath.row];
    AnswerModel* model = layout.statusModel;
    AnswerCellLayout* newLayout = [[AnswerCellLayout alloc] initWithStatusModel:model
                                                              index:cell.indexPath.row
                                                      dateFormatter:self.dateFormatter];
    
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
    [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:newLayout];
    [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath]
                          withRowAnimation:UITableViewRowAnimationNone];
}




#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    if (offset <= -RefreshBoundary) {
        [self refreshBegin];
    }
}

#pragma mark - Data

//模拟下拉刷新
- (void)refreshBegin {
    [UIView animateWithDuration:0.2f animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(RefreshBoundary, 0.0f, 0.0f, 0.0f);
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
                           [self fakeDownload];
                       });
    }];
}

//模拟下载数据
- (void)fakeDownload {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.needRefresh) {
            [self.dataSource removeAllObjects];
            for (NSInteger i = 0 ; i < 10; i ++) {//让数据更多
                for (NSInteger i = 0; i < self.fakeDatasource.count; i ++) {
                    LWLayout* layout = [self layoutWithStatusModel:
                                        [[AnswerModel alloc] initWithDict:self.fakeDatasource[i]]
                                                             index:i];
                    [self.dataSource addObject:layout];
                }
            }
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self refreshComplete];
        });
    });
}

//模拟刷新完成
- (void)refreshComplete {
    [self.tableView reloadData];
    [UIView animateWithDuration:0.35f animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
    } completion:^(BOOL finished) {
        self.needRefresh = NO;
    }];
}


- (AnswerCellLayout *)layoutWithStatusModel:(AnswerModel *)statusModel index:(NSInteger)index {
    AnswerCellLayout* layout = [[AnswerCellLayout alloc] initWithStatusModel:statusModel
                                                           index:index
                                                   dateFormatter:self.dateFormatter];
    return layout;
}

#pragma mark - Getter

- (void)setup {
    self.needRefresh = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"问答";
}

//tableView
- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:SCREEN_BOUNDS
                                              style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}

//回答问题
-(UIView *)answerView
{
    if (!_answerView) {
        _answerView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*5/6, SCREEN_HEIGHT*8/9, SCREEN_WIDTH/6-10, SCREEN_WIDTH/6-10)];
        _answerView.layer.cornerRadius = (SCREEN_WIDTH/6-10)/2;
        _answerView.layer.masksToBounds = YES;
        _answerView.backgroundColor = [UIColor blueColor];
        UIImageView *image = [[UIImageView alloc]initWithFrame:_answerView.bounds];
        image.image = [UIImage imageNamed:@"answer_image"];
        image.userInteractionEnabled = YES;
        [image addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(requireCkickBtn:)]];
        
        [_answerView addSubview:image];
    }
    return _answerView;
}


- (NSMutableArray *)dataSource {
    if (_dataSource) {
        return _dataSource;
    }
    _dataSource = [[NSMutableArray alloc] init];
    return _dataSource;
}

- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter* dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日 hh:mm"];
    });
    return dateFormatter;
}


- (NSArray *)fakeDatasource {
    if (_fakeDatasource) {
        return _fakeDatasource;
    }
    _fakeDatasource =
    @[@{@"type":@"image",
        @"name":@"型格志style",
        @"avatar":@"http://tp4.sinaimg.cn/5747171147/50/5741401933/0",
        @"content":@"春天卫衣的正确打开方式https://github.com/waynezxcv/Gallop",
        @"date":@"1459668442",
        
        @"statusID":@"8",
        },
      
      @{@"type":@"image",
        @"name":@"SIZE潮流生活",
        @"avatar":@"http://tp2.sinaimg.cn/1829483361/50/5753078359/1",
        @"content":@"近日[心][心][心][心][心][心][face]，adidas Originals😂为经典鞋款Stan Smith打造Primeknit版本，并带来全新的“OG”系列。简约的鞋身采用白色透气Primeknit针织材质制作，再将Stan Smith代表性的绿、红、深蓝三个元年色调融入到鞋舌和后跟点缀，最后搭载上米白色大底来保留其复古风味。据悉该鞋款将在今月登陆全球各大adidas Originals指定店舖。https://github.com/waynezxcv/Gallop <-",
        @"date":@"1459668442",
        @"statusID":@"1",
        },
      
      @{@"type":@"website",
        @"name":@"Ronaldo",
        @"avatar":@"https://avatars0.githubusercontent.com/u/8408918?v=3&s=460",
        @"content":@"Easy to use yet capable of so much, iOS 9 was engineered to work hand in hand with the advanced technologies built into iPhone.",
        @"date":@"1459668442",
        
        @"detail":@"LWAlchemy,A fast and lightweight ORM framework for Cocoa and Cocoa Touch.",
        @"statusID":@"1",
        },
      
      
      @{@"type":@"image",
        @"name":@"妖妖小精",
        @"avatar":@"http://tp2.sinaimg.cn/2185608961/50/5714822219/0",
        @"content":@"出国留学的儿子为思念自己的家人们寄来一个用自己照片做成的人形立牌",
        @"date":@"1459668442",
        @"statusID":@"2",
        },
      
      @{@"type":@"image",
        @"name":@"Instagram热门",
        @"avatar":@"http://tp4.sinaimg.cn/5074408479/50/5706839595/0",
        @"content":@"Austin Butler & Vanessa Hudgens  想试试看扑到一个一米八几的人怀里是有多舒服[心]",
        @"date":@"1459668442",
        @"statusID":@"3",
        },
      
      
      @{@"type":@"image",
        @"name":@"头条新闻",
        @"avatar":@"http://tp1.sinaimg.cn/1618051664/50/5735009977/0",
        @"content":@"#万象# 【熊孩子！4名小学生铁轨上设障碍物逼停火车】4名小学生打赌，1人认为火车会将石头碾成粉末，其余3人不信，认为只会碾碎，于是他们将道碴摆放在铁轨上。火车司机发现前方不远处的铁轨上，摆放了影响行车安全的障碍物，于是紧急采取制动，列车中途停车13分钟。O4名学生铁轨上设障碍物逼停火车#waynezxcv# nice",
        @"date":@"1459668442",
        @"statusID":@"4",
        },
      
      
      @{@"type":@"image",
        @"name":@"Kindle中国",
        @"avatar":@"http://tp1.sinaimg.cn/3262223112/50/5684307907/1",
        @"content":@"#只限今日#《简单的逻辑学》作者D.Q.麦克伦尼在书中提出了28种非逻辑思维形式，抛却了逻辑学一贯的刻板理论，转而以轻松的笔触带领我们畅游这个精彩无比的逻辑世界；《蝴蝶梦》我错了，我曾以为付出自己就是爱你。全球公认20世纪伟大的爱情经典，大陆独家合法授权。",
        @"date":@"",
        @"statusID":@"6",
        },
      
      
      
      @{@"type":@"image",
        @"name":@"G-SHOCK",
        @"avatar":@"http://tp3.sinaimg.cn/1595142730/50/5691224157/1",
        @"content":@"就算平时没有时间，周末也要带着G-SHOCK到户外走走，感受大自然的满满正能量！",
        @"date":@"1459668442",
        @"statusID":@"7",
        },
      
      
      
      
      
      @{@"type":@"image",
        @"name":@"数字尾巴",
        @"avatar":@"http://tp1.sinaimg.cn/1726544024/50/5630520790/1",
        @"content":@"外媒 AndroidAuthority 日前曝光诺基亚首款回归作品 NOKIA A1 的渲染图，手机的外形很 N 记，边框控制的不错。这是一款纯正的 Android 机型，传闻手机将采用 5.5 英寸 1080P 屏幕，搭载骁龙 652，Android 6.0 系统，并使用了诺基亚自家的 Z 启动器，不过具体发表的时间还是未知。尾巴们你会期待吗？",
        @"date":@"1459668442",
        @"statusID":@"9",
        },
      
      
      @{@"type":@"image",
        @"name":@"欧美街拍XOXO",
        @"avatar":@"http://tp4.sinaimg.cn/1708004923/50/1283204657/0",
        @"content":@"3.31～4.2 肯豆",
        @"date":@"1459668442",
        @"statusID":@"10",
        },
      ];
    return _fakeDatasource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
