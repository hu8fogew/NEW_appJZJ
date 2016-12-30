//
//  QuestionDescCell.m
//  家长界
//
//  Created by mac on 2016/12/1.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QuestionDescCell.h"
#import "LWAsyncDisplayLayer.h"
#import "DetialQuestionLayout.h"
@interface QuestionDescCell()<LWAsyncDisplayViewDelegate>

@property(nonatomic,strong)LWAsyncDisplayView *asyncView;

@end
@implementation QuestionDescCell

/*

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //头像
        _imageHead = [[UIImageView alloc]init];
        _imageHead.frame = CGRectMake(10, 15, 30, 30);
        _imageHead.layer.cornerRadius = 15;
        _imageHead.layer.borderWidth = 1.0f;
        _imageHead.layer.borderColor = [HWColor(232, 232, 232) CGColor];
        _imageHead.layer.backgroundColor = [[UIColor whiteColor] CGColor];
        _imageHead.layer.masksToBounds = YES;
        _imageHead.image = [UIImage imageNamed:@"teacherimage"];
        [self.contentView addSubview:_imageHead];
        
        //用户类型
        _ueserKind = [self createLabelWithColor:HWColor(153, 153, 153) andFont:14 andFrame:CGRectMake(_imageHead.right+5, _imageHead.top, CGFLOAT_MAX, _imageHead.height)];
        _ueserKind.text = @"家长界会员用户";
        //发布时间
        _sendDate = [self createLabelWithColor:HWColor(153, 153, 153) andFont:14 andFrame:CGRectMake(_ueserKind.right+10, _ueserKind.top, CGFLOAT_MAX, _ueserKind.height)];
        _ueserKind.text = @"6小时之前";
        //问题
        _mainQues = [self createLabelWithColor:HWColor(53, 53, 53) andFont:17 andFrame:CGRectMake(_imageHead.left, _imageHead.botoom+10, SCREEN_WIDTH-20, CGFLOAT_MAX)];
        _mainQues.text = @"为什么快餐时代的充斥导致现代的人们不能静下心来酿一壶好酒呢？";
        //问题的回答
        _detialAnswer = [self createLabelWithColor:HWColor(153, 153, 153) andFont:15 andFrame:CGRectMake(_mainQues.left, _mainQues.botoom+10, _mainQues.width, 40)];
        _detialAnswer.numberOfLines = 3;
        _detialAnswer.font = [UIFont fontWithName:@"ArialMT" size:15];
        _detialAnswer.text = @"从业十余年来，精通各种技术的人么有都少，运用自如的人更是少之又少，之所以成为这样的情况，是因为快餐时代的充斥，是大部分人习惯了快餐的节奏，没有精益求精的耐心去学习，深造。使得一些古老工艺的遗失，而人们内心又渴望那个有着高潮精湛的艺术品。";
        //回答个数
        _numOfAnswer = [self createLabelWithColor:HWColor(153, 153, 153) andFont:14 andFrame:CGRectMake(_detialAnswer.left, _detialAnswer.botoom+10, _detialAnswer.width, 30)];
        _numOfAnswer.textAlignment = NSTextAlignmentRight;
        _numOfAnswer.text = @"103个回答";
        self.wdCellHight = [self cellHeight];
        
    }
    return self;
}

-(CGFloat)cellHeight
{
    return _numOfAnswer.botoom+10;
}



-(UILabel *)createLabelWithColor:(UIColor *)color andFont:(CGFloat)size andFrame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.backgroundColor = [UIColor whiteColor];
    lab.textColor =color;
    lab.font = [UIFont systemFontOfSize:size];
    lab.frame = frame;
    [self.contentView addSubview:lab];
    return lab;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.height = self.wdCellHight;
}
*/


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = HWColor(232, 232, 232);
        [self.contentView addSubview:self.asyncView];
    }
    return self;
}


- (void)extraAsyncDisplayIncontext:(CGContextRef)context
                              size:(CGSize)size
                       isCancelled:(LWAsyncDisplayIsCanclledBlock)isCancelled {
    if (!isCancelled()) {
        CGContextMoveToPoint(context, 0.0f, self.bounds.size.height);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextSetLineWidth(context, 0.2f);
        CGContextSetStrokeColorWithColor(context,RGB(220.0f, 220.0f, 220.0f, 1).CGColor);
        CGContextStrokePath(context);
        
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.wdCellLayout.wdCellHeight);
    
}




-(LWAsyncDisplayView *)asyncView
{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.delegate = self;
    }
    return _asyncView;
}

-(DetialQuestionLayout *)wdCellLayout
{
    if (!_wdCellLayout) {
        _wdCellLayout = [[DetialQuestionLayout alloc]initQuestionDeatail];
        self.asyncView.layout = _wdCellLayout;
    }
    return _wdCellLayout;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
