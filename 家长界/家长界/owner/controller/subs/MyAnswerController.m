//
//  MyAnswerController.m
//  家长界
//
//  Created by mac on 2016/12/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MyAnswerController.h"

@interface MyAnswerController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *answerTable;

@end

@implementation MyAnswerController

#pragma mark -----------懒加载----------
-(UITableView *)answerTable
{
    if (!_answerTable) {
        _answerTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _answerTable.delegate = self;
        _answerTable.dataSource = self;
        _answerTable.backgroundColor = [UIColor whiteColor];
        _answerTable.separatorStyle = UITableViewCellAccessoryNone;
        [self.view addSubview:_answerTable];
    }
    return _answerTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.answerTable registerClass:[MyAnswerCell class] forCellReuseIdentifier:NSStringFromClass([MyAnswerCell class])];
    [self.answerTable reloadData];
    
}


#pragma mark  --------TableViewDateSource&delegate
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
    MyAnswerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyAnswerCell class])];
    cell.answerImage.image = [UIImage imageNamed:@"teacherImage"];
    cell.nameOfUser.text = @"花蝴蝶";
    cell.timeLabel.text = @"10小时之前";
    cell.mechineLabel.text = @"来自iphone7plus";
    cell.answerLabel.text = @"孩子不听话怎么办";
    cell.answerText.text = @"回答";
    cell.descAnswer.text = @"我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来，我最近有点方，我要给他shi打出来。";
    return cell;
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MyAnswerCell whc_CellHeightForIndexPath:indexPath tableView:tableView];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    
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
