//
//  QZdetailViewController.m
//  家长界
//
//  Created by taylor on 2016/11/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QZdetailViewController.h"
#import "firstSectionTableViewCell.h"
#import "secondSectionTableViewCell.h"
#import "SchoolTableViewCell.h"
#import "QZDetailTopView.h"
@interface QZdetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

//底部视图
@property (nonatomic,strong) UIView *bottomView;

@property(nonatomic,strong)UIView *DetailheaderView;

/*头部描述视图*/
@property(nonatomic,strong)UIView *discView;

/*图片*/
@property (nonatomic,strong)UIView *imageBackView;

@end

@implementation QZdetailViewController
static const int imageViewHeight = 150;
static const int topDiscViewHeight = 90;
static const int ViewLeftMergin = 10;
static const int bottomViewHeight = 50;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.bottomView];
    [self createView];
    [self createtableView];
    
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - bottomViewHeight, SCREEN_WIDTH, bottomViewHeight)];
    }
    return _bottomView;
}

-(UIView *)DetailheaderView
{
    if (!_DetailheaderView) {
        _DetailheaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _DetailheaderView.backgroundColor = HWColor(242, 242, 242);
    }
    
    return _DetailheaderView;
    
}
-(UIView *)discView
{
    if (!_discView) {
        _discView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topDiscViewHeight)];
        _discView.backgroundColor = [UIColor whiteColor];
        QZDetailTopView *vi = [[QZDetailTopView alloc]initWithFrame:self.discView.bounds];
        //标题
        vi.titleLabel.frame = CGRectMake(ViewLeftMergin, 20, SCREEN_WIDTH, topDiscViewHeight/3);
        //时间
        vi.timeLabel.frame = CGRectMake(ViewLeftMergin, vi.titleLabel.y+vi.titleLabel.height, SCREEN_WIDTH/3+30, topDiscViewHeight/3);
        //浏览
        vi.scanLabel.frame = CGRectMake(vi.timeLabel.x+vi.timeLabel.width+5, vi.titleLabel.y+vi.titleLabel.height, SCREEN_WIDTH/3, vi.timeLabel.height);
        //转发
        vi.shareBtn.frame = CGRectMake(SCREEN_WIDTH-40, vi.timeLabel.y, vi.timeLabel.height, vi.timeLabel.height);
        //收藏
        vi.saveBtn.frame = CGRectMake(vi.shareBtn.x-vi.shareBtn.width, vi.timeLabel.y-2, vi.timeLabel.height, vi.timeLabel.height);
        
        [_discView addSubview:vi];
        
    }
    return _discView;
}

-(UIView *)imageBackView
{
    if (!_imageBackView) {
        
        _imageBackView = [[UIView alloc]initWithFrame:CGRectMake(0, self.discView.y+self.discView.height, SCREEN_WIDTH, imageViewHeight)];
        _imageBackView.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ViewLeftMergin, 0, SCREEN_WIDTH-2*ViewLeftMergin, self.imageBackView.height-ViewLeftMergin)];
        imageView.image = [UIImage imageNamed:@"hh"];
        
        [_imageBackView addSubview:imageView];
        
}
    
    return _imageBackView;
    
}


-(void)createtableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - bottomViewHeight - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = self.DetailheaderView;
    _tableView.tableHeaderView.height = self.discView.height + self.imageBackView.height;
    [self.view addSubview:self.tableView];
    [self.DetailheaderView addSubview:self.discView];
    [self.DetailheaderView addSubview:self.imageBackView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"firstSectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"firstSectionTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"secondSectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"secondSectionTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"SchoolTableViewCell" bundle:nil] forCellReuseIdentifier:@"SchoolTableViewCell"];
}


-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, bottomViewHeight)];
    label.textAlignment = 1;
    label.text = @"¥286人已报名";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:20];
    label.backgroundColor = HWColor(244, 244, 244);
    self.applyText = label;
    [self.bottomView addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = HWColor(30, 172, 223);
    [btn setTitle:@"我要报名" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickApply) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, bottomViewHeight)];
    [self.bottomView addSubview:btn];
}

-(void)clickApply{
    HWLog(@"我要报名");
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 5;
            break;
        case 1:
            rows = 1;
            break;
        default:
            rows = 6;
            break;
    }
    return rows;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 60;
            break;
         case 1:

            return 200;
            break;
        default:
            return 130;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        firstSectionTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstSectionTableViewCell"];
            if (indexPath.row == 0) {
                firstCell.titleLabel.text = @"活动类型";
                firstCell.detailLabel.text = @"线下活动";
            }else if (indexPath.row == 1){
                firstCell.titleLabel.text = @"培训机构";
                firstCell.detailLabel.text = @"北大青鸟";
            }
            else if (indexPath.row == 2){
                firstCell.titleLabel.text = @"活动时间";
                firstCell.detailLabel.text = @"2016-11-18 18：00";
            }
            else if (indexPath.row == 3){
                firstCell.titleLabel.text = @"报名截止";
                firstCell.detailLabel.text = @"2016-11-28 14：00";
            }else {
                firstCell.titleLabel.text = @"活动地点";
                firstCell.detailLabel.text = @"南三环i都会";
            }
        
              return firstCell;
        
    }else if (indexPath.section == 1){

        secondSectionTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"secondSectionTableViewCell"];
        
        secondCell.detailLabel.text = @"即使如此，即使再难，人们脱贫的愿望依旧热切，每年背上行李包冲上北上广的年轻人只增不减，他们向命运呐喊，难不是不可能。都知道贫穷是可怕的，比穷更可怕的是，穷并堕落着。无需你在体育馆、无需你到健身房，只需一把椅子，可以在宽敞明亮";
        
        return secondCell;
        
    }else{
        static NSString *identifier = @"identifier";
        QZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            cell = [[QZTableViewCell alloc]initWithFrame:cell.bounds];
            
            cell.qzImageLogo.image = [UIImage imageNamed:@"qzImage"];
            cell.qzMainLabel.text = @"帮孩子塑造乐观积极性格";
            cell.qzLabel.text = @"发布时间：2016-08-26";
            cell.qzNumberOfPerson.text = @"2862人参加";
            NSArray *arr = @[@"亚洲",@"亲子游"];
            
            for (int i = 0; i<arr.count; i++) {
                UILabel *kindLabel = [[UILabel alloc]initWithFrame:CGRectMake(2+i*(cell.actionKindView.width*2/7 + 15), 4, cell.actionKindView.width*2/5-10, cell.actionKindView.height-8)];
                kindLabel.text = arr[i];
                kindLabel.font = [UIFont systemFontOfSize:12];
                kindLabel.layer.borderColor = [HWColor(146, 210, 205) CGColor];
                kindLabel.textAlignment = 1;
                kindLabel.layer.borderWidth = 1.5;
                kindLabel.textColor = HWColor(146, 210, 205);
                kindLabel.layer.cornerRadius = 3;
                kindLabel.layer.masksToBounds = YES;
                
                [cell.actionKindView addSubview:kindLabel];
                
            }
            
        }
        
        
        return cell;

    }
    
    
    return nil;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
