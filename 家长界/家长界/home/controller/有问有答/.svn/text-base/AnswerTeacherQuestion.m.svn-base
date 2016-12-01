//
//  AnswerTeacherQuestion.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerTeacherQuestion.h"

@interface AnswerTeacherQuestion ()<UITableViewDelegate,UITableViewDataSource>

/*主标题视图（headerView）*/
@property(nonatomic,strong)UIView *headerOfQuestion;

/*主标题*/
@property(nonatomic,strong)UIView *mainQuestionView;

/*提示条*/
@property(nonatomic,strong)UIView *titleView;

/*TableView*/
@property(nonatomic,strong)UITableView *questionTable;

/*回答问题的视图*/
@property(nonatomic,strong)UIView *answerView;

@end

@implementation AnswerTeacherQuestion
/*问题描述的高度*/
static const int discQuesHeight = 160;
/*我要回答的高度*/
static const int answerHeight = 80;

#pragma mark  /***********懒加载**********/
/*headerView*/
-(UIView *)headerOfQuestion
{
    if (!_headerOfQuestion) {
        _headerOfQuestion = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _headerOfQuestion.backgroundColor = HWColor(242, 242, 242);
    }
    return _headerOfQuestion;
}

/*回答问题的视图设置*/

-(UIView *)answerView
{
    if (!_answerView) {
        _answerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.questionTable.height, SCREEN_WIDTH, answerHeight)];
        _answerView.backgroundColor = [UIColor whiteColor];
    }
    return _answerView;
}

/*主标题视图*/
-(UIView *)mainQuestionView
{
    if (!_mainQuestionView) {
        _mainQuestionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, discQuesHeight)];
        _mainQuestionView.backgroundColor = [UIColor whiteColor];
        AnswerDetialHeader *detailVi = [[AnswerDetialHeader alloc]initWithFrame:_mainQuestionView.frame];
        detailVi.imageWH.frame = CGRectMake(10, 18, SCREEN_WIDTH/20, SCREEN_WIDTH/20);
        detailVi.questionLabel.frame = CGRectMake(detailVi.imageWH.x+detailVi.imageWH.width+6, 15, SCREEN_WIDTH*3/4, SCREEN_WIDTH/16);
        detailVi.numberOfAnswer.frame = CGRectMake(SCREEN_WIDTH*4/5, detailVi.imageWH.y, SCREEN_WIDTH/5-10, detailVi.questionLabel.height);
        
        detailVi.labelF.frame = CGRectMake(detailVi.imageWH.x, detailVi.imageWH.y+detailVi.imageWH.height+6, SCREEN_WIDTH*2/9, SCREEN_WIDTH/16);
        UIView *vF = [[UIView alloc]initWithFrame:CGRectMake(detailVi.labelF.x+detailVi.labelF.width, detailVi.labelF.y+3, 1.5, detailVi.labelF.height-6)];
        vF.backgroundColor = HWColor(152, 152, 152);
        [detailVi addSubview:vF];
        detailVi.labelS.frame = CGRectMake(vF.x+vF.width, detailVi.labelF.y, SCREEN_WIDTH*1/4, detailVi.labelF.height);
        
        UIView *Vs = [[UIView alloc]initWithFrame:CGRectMake(detailVi.labelS.x+detailVi.labelS.width, vF.y, 1, vF.height)];
        Vs.backgroundColor = HWColor(152, 152, 152);
        [detailVi addSubview:Vs];
        
        detailVi.labelT.frame = CGRectMake(Vs.x+Vs.width, detailVi.labelF.y, SCREEN_WIDTH-Vs.x-Vs.width, detailVi.labelF.height);
        detailVi.discQuestion.frame = CGRectMake(detailVi.labelF.x, detailVi.labelF.y+detailVi.labelF.height, SCREEN_WIDTH-detailVi.labelF.x, detailVi.height-(detailVi.labelF.y+detailVi.labelF.height));
        [_mainQuestionView addSubview:detailVi];
    }
    return _mainQuestionView;
}

/*标题提示视图*/
-(UIView *)titleView
{
    if (!_titleView) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, self.mainQuestionView.height+self.mainQuestionView.y+DistanceForCell, SCREEN_WIDTH, 50)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.titleView.width-15, self.titleView.height)];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:20];
        label.textColor = [UIColor blackColor];
        label.text = @"问题回答";
        _titleView.backgroundColor = [UIColor whiteColor];
        [_titleView addSubview:label];
        
    }
    return _titleView;
}

/*TableView的懒加载*/
-(UITableView *)questionTable
{
    if (!_questionTable) {
        _questionTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-answerHeight)];
        _questionTable.delegate = self;
        _questionTable.dataSource = self;
        _questionTable.tableHeaderView = self.headerOfQuestion;
        _questionTable.allowsSelection = NO;
        _questionTable.tableHeaderView.height = self.titleView.y+self.titleView.height;
        
    }
    return _questionTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
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

#pragma mark 加载视图

-(void)createView
{
    
    [self.view addSubview:self.questionTable];
    [self.view addSubview:self.answerView];
    
    UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [answerBtn addTarget:self action:@selector(answerQuestionClick) forControlEvents:UIControlEventTouchUpInside];
    answerBtn.frame = CGRectMake(SCREEN_WIDTH/8, self.answerView.height/4, SCREEN_WIDTH-SCREEN_WIDTH/4, self.answerView.height/2);
    answerBtn.backgroundColor = HWColor(107, 160, 220);
    [answerBtn setTitle:@"我来回答" forState:UIControlStateNormal];
    [answerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    answerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.answerView addSubview:answerBtn];
    [self.headerOfQuestion addSubview:self.mainQuestionView];
    
    [self.headerOfQuestion addSubview:self.titleView];
    
}

#pragma mark 我来回答的点击事件
-(void)answerQuestionClick
{
 
#warning mark  老师和家长实现的方法不一样
/*
    AnswerEidttingView *vc = [[AnswerEidttingView alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
 */
    AnswerQuestion *answer = [[AnswerQuestion alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*2/3, SCREEN_WIDTH, SCREEN_HEIGHT/3)andSuperView:self.view];
    answer.answerText.frame = CGRectMake(20, 30, answer.width-40, answer.height*2/3-15);
    
    answer.commitBtn.frame = CGRectMake(answer.width-70, answer.height-40, 60, 30);

    
    HWLog(@"我来回答");
    
}




#pragma mark tableView的代理协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    AnswerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AnswerTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, cell.height)];
        cell.teacherImage.image = [UIImage imageNamed:@"teacherImage"];
        
        cell.teacherName.text = @"韩雪冬";
        cell.smallImage.image = [UIImage imageNamed:@"good"];
        cell.number.text = @"38";
        cell.mainLabel.text = @"2016-11-25 09:45";
        NSString *str = @"这里有各种创意心理应用，通过有趣的方式体验心理学的乐趣。如果你有压力，就来试试“放空一分钟”吧";
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
        NSMutableParagraphStyle *paragraphSytle = [[NSMutableParagraphStyle alloc]init];
        [paragraphSytle setLineSpacing:4];
        [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphSytle range:NSMakeRange(0, [str length])];
        [cell.detialLabel setAttributedText:attributedStr];
        [cell.detialLabel sizeToFit];
        
    }
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 170;
    
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
