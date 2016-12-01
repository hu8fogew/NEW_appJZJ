//
//  AnswerEidttingView.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerEidttingView.h"

@interface AnswerEidttingView ()<UITextViewDelegate>

/*标题视图*/
@property(nonatomic,strong)UIView *quesHeaderView;

/*详细问题的输入框*/
@property(nonatomic,strong)UIView *detailQuestView;

/*发送视图*/
@property(nonatomic,strong)UIView *sendView;


/*主标题*/
@property(nonatomic,strong)TextQuestionView *textMainQuestView;
/*详情问题*/

@property(nonatomic,strong)PlaceholderTextView *textDetail;
/*计数label*/
@property(nonatomic,strong)UILabel *numOfText;


/*选择按钮*/
@property(nonatomic,strong)UIButton *seleBtn;
@end

@implementation AnswerEidttingView
/*主标题*/
static const int mainQuestHeight = quesMainTextView;
/*详情问题*/
static const int detailQuestHeight = 180;

#pragma mark /*********懒加载*********/

/*详细问题输入框*/
-(PlaceholderTextView *)textDetail
{
    if (!_textDetail) {
        _textDetail = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(10, 4, SCREEN_WIDTH-20, detailQuestHeight-60)];
        
        _textDetail.backgroundColor = [UIColor whiteColor];
        _textDetail.delegate = self;
        _textDetail.font = [UIFont systemFontOfSize:15];
        
        _textDetail.textColor = [UIColor blackColor];
        _textDetail.textAlignment = NSTextAlignmentLeft;
        _textDetail.editable = YES;
        _textDetail.placeholderColor = HWColor(100, 100, 100);
        _textDetail.placeholder = @"详细描述你的问题（不少于40个字），才能获得更好的解答哦～";
        
    }
    return _textDetail;
}

/*主标题*/
-(UIView *)quesHeaderView
{
    if (!_quesHeaderView) {
        _quesHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, mainQuestHeight)];
        _quesHeaderView.backgroundColor = [UIColor whiteColor];
        self.textMainQuestView = [[TextQuestionView alloc]initWithFrame:_quesHeaderView.bounds];
        self.textMainQuestView.lab.frame = CGRectMake(10, 22, SCREEN_WIDTH/9, quesMainTextView-22);
        self.textMainQuestView.textMain.frame = CGRectMake(self.textMainQuestView.lab.width+self.textMainQuestView.lab.x, 30, SCREEN_WIDTH-20, quesMainTextView-30);
        [_quesHeaderView addSubview:self.textMainQuestView];
    }
    return _quesHeaderView;
}

/*问题详情*/
-(UIView *)detailQuestView
{
    if (!_detailQuestView) {
        _detailQuestView = [[UIView alloc]initWithFrame:CGRectMake(0, self.quesHeaderView.y+self.quesHeaderView.height+1.5, SCREEN_WIDTH, detailQuestHeight)];
        _detailQuestView.backgroundColor = [UIColor whiteColor];
        self.numOfText = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70, self.textDetail.y+self.textDetail.height+20, 60, 36)];
        self.numOfText.font = [UIFont systemFontOfSize:16];
        self.numOfText.textColor = HWColor(140, 140, 140);
        self.numOfText.text = @"0/300";
        self.numOfText.textAlignment = NSTextAlignmentRight;
        self.numOfText.backgroundColor = [UIColor whiteColor];
        [_detailQuestView addSubview:self.numOfText];
        [_detailQuestView addSubview:self.textDetail];
    }
    return _detailQuestView;
}

/*发送视图*/
-(UIView *)sendView
{
    if (!_sendView) {
        _sendView = [[UIView alloc]initWithFrame:CGRectMake(0, self.detailQuestView.y+self.detailQuestView.height+1.5, SCREEN_WIDTH, SCREEN_HEIGHT-(self.detailQuestView.y+self.detailQuestView.height+1.5))];
        _sendView.backgroundColor = [UIColor whiteColor];
    }
    return _sendView;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"回答问题";

    self.view.backgroundColor = HWColor(232, 232, 232);
    
    [self createView];

}

/*加载视图*/
-(void)createView
{
    
    [self.view addSubview:self.quesHeaderView];
    
    [self.view addSubview:self.detailQuestView];
    [self.view addSubview:self.sendView];
    [self setupSenderView];
    
    self.seleBtn.selected = NO;
}

-(void)setupSenderView
{
    UIButton *send = [UIButton buttonWithType:UIButtonTypeSystem];
    [send setTitle:@"写好了" forState:UIControlStateNormal];
    [send setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    send.backgroundColor = HWColor(190, 190, 190);
    
    send.titleLabel.font = [UIFont systemFontOfSize:18];
    send.layer.cornerRadius = 4;
    send.layer.masksToBounds = YES;
    [send addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
    
    [send setFrame:CGRectMake(SCREEN_WIDTH-70, 10, 60, 30)];
    [self.sendView addSubview:send];
    
    UIButton *seleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    seleBtn.frame = CGRectMake(20, send.y, send.height, send.height);
    [seleBtn setBackgroundImage:[UIImage imageNamed:@"checkboxnomal"] forState:UIControlStateNormal];

    [seleBtn setBackgroundImage:[UIImage imageNamed:@"checkboxselect"] forState:UIControlStateSelected];

    seleBtn.tintColor = [UIColor whiteColor];
    [seleBtn addTarget:self action:@selector(selecteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.seleBtn = seleBtn;
    [self.sendView addSubview:seleBtn];
    
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(seleBtn.x+seleBtn.width+2, seleBtn.y, SCREEN_WIDTH/5, seleBtn.height)];
    
    la.font = [UIFont systemFontOfSize:18];
    la.textColor = [UIColor blackColor];
    la.text = @"匿名发布";
    la.textAlignment = NSTextAlignmentCenter;
    [self.sendView addSubview:la];
    
    
    
}

/*发问*/
-(void)sendClick
{
    if ([self.textDetail.text isEqual:@""] || [self.textMainQuestView.textMain.text isEqualToString:@""]) {
        
        UIAlertController *alertLength = [UIAlertController alertControllerWithTitle:@"提示" message:@"你输入的信息为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *suer = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertLength addAction:suer];
        [self presentViewController:alertLength animated:YES completion:nil];
    }else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/*改变选中状态*/

-(void)selecteBtnClick
{
    self.seleBtn.selected = !self.seleBtn.selected;
    
    if (self.seleBtn.selected == YES) {
        HWLog(@"已勾选");
    }
    
    if (self.seleBtn.selected == NO) {
        HWLog(@"未勾选");
    }
    
    
}



#pragma mark 计算textDetail的输入字符长度
-(void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.numOfText.text = [NSString stringWithFormat:@"%ld/300",(long)wordCount];
    
    [self wordLimit:textView];
    
}

-(BOOL)wordLimit:(UITextView *)text
{
    if (text.text.length<300) {
        HWLog(@"%ld",text.text.length);
        self.textDetail.editable = YES;
    }else
    {
        self.textDetail.editable = NO;
    }
    return nil;
}

//把回车键当做退出键盘的响应键  textView退出键盘的操作
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
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
