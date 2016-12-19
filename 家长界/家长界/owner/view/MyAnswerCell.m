//
//  MyAnswerCell.m
//  家长界
//
//  Created by mac on 2016/12/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MyAnswerCell.h"

@implementation MyAnswerCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        UIView *backView = [[UIView alloc]init];
//        backView.backgroundColor = [UIColor whiteColor];
//        backView.whc_TopSpace(0);
//        backView.whc_LeftSpace(0);
//        backView.whc_Size(CGSizeMake(SCREEN_WIDTH, 80));
//        [self.contentView addSubview:backView];
        self.backgroundColor = HWColor(242, 242, 242);
//        self.contentView.height = 30;
//        self.whc_CellBottomOffset = 5;
        
     /*
        _answerImage = [[UIImageView alloc]init];
        _answerImage.whc_LeftSpace(10);
        _answerImage.whc_TopSpace(20);
        _answerImage.whc_Size(CGSizeMake(60, 60));
        _answerImage.layer.cornerRadius = _answerImage.width/2;
        _answerImage.layer.masksToBounds = YES;
        [backView addSubview:_answerImage];
      
        _nameOfUser = [self createLabelWithFont:[UIFont systemFontOfSize:18] andTextColor:HWColor(53, 53, 53) andSv:backView];
        _nameOfUser.whc_LeftSpaceToView(8,_answerImage);
        _nameOfUser.whc_TopSpaceEqualView(_answerImage);
        _nameOfUser.whc_Size(CGSizeMake(SCREEN_WIDTH/4, _answerImage.height/2));
        
        _deleteCell = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteCell setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_deleteCell setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteCell setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
        _deleteCell.titleLabel.font = [UIFont systemFontOfSize:16];
        _deleteCell.layer.masksToBounds = YES;
        _deleteCell.layer.cornerRadius = 4;
        _deleteCell.layer.borderWidth = 2;
        _deleteCell.layer.borderColor = [HWColor(153, 153, 153) CGColor];
        [backView addSubview:_deleteCell];
        _deleteCell.whc_Size(CGSizeMake(40, _answerImage.height/2));
        _deleteCell.whc_TopSpaceEqualView(_answerImage);
        _deleteCell.whc_RightSpace(10);
        
        _timeLabel = [self createLabelWithFont:[UIFont systemFontOfSize:14] andTextColor:HWColor(153, 153, 153) andSv:backView];
        _timeLabel.whc_LeadingSpaceEqualView(_nameOfUser);
        _timeLabel.whc_TopSpaceToView(0,_nameOfUser);
        _timeLabel.whc_Size(CGSizeMake(40, _answerImage.height/2));
        
        _mechineLabel = [self createLabelWithFont:[UIFont systemFontOfSize:14] andTextColor:HWColor(153, 153, 153) andSv:backView];
        _mechineLabel.whc_LeftSpaceToView(5,_timeLabel);
        _mechineLabel.whc_TopSpaceEqualView(_timeLabel);
        _mechineLabel.whc_Size(CGSizeMake(80, _timeLabel.height));
        _answerLabel = [self createLabelWithFont:[UIFont systemFontOfSize:18] andTextColor:HWColor(53, 53, 53) andSv:backView];
        _answerLabel.whc_LeftSpaceEqualView(_answerImage);
        _answerLabel.whc_TopSpaceToView(3,_answerImage);
        _answerLabel.whc_Size(CGSizeMake(SCREEN_WIDTH-20, 40));
        UIView *vi = [UIView new];
        vi.backgroundColor = HWColor(242, 242, 242);
        
        [backView addSubview:vi];
        vi.whc_LeftSpaceEqualView(_answerLabel);
        vi.whc_TopSpaceToView(0,_answerLabel);
        vi.whc_RightSpaceEqualView(_deleteCell);
        vi.whc_BottomSpaceToView(10,backView);
        _answerText = [self createLabelWithFont: [UIFont systemFontOfSize:15] andTextColor:HWColor(95, 146, 218) andSv:vi];
        _answerText.textAlignment = NSTextAlignmentRight;
        _answerText.whc_LeftSpace(0);
        _answerText.whc_TopSpace(0);
        _answerText.whc_Size(CGSizeMake(30, 20));
        
        _timeAnswer = [self createLabelWithFont:[UIFont systemFontOfSize:13] andTextColor:HWColor(153, 153, 153) andSv:vi];
        _timeAnswer.textAlignment = NSTextAlignmentRight;
        _timeAnswer.whc_BottomSpace(0);
        _timeAnswer.whc_RightSpace(0);
        _timeAnswer.whc_Size(CGSizeMake(vi.width, 25));
        
        _descAnswer = [self createLabelWithFont:[UIFont systemFontOfSize:15] andTextColor:HWColor(53, 53, 53) andSv:vi];
        _descAnswer.whc_TopSpaceEqualView(_answerText);
        _descAnswer.whc_BottomSpaceToView(0,_timeAnswer);
        _descAnswer.whc_LeftSpaceToView(0,_answerText);
        _descAnswer.whc_RightSpace(0);
       */
    }
    return  self;
}




-(UILabel *)createLabelWithFont:(UIFont *)font andTextColor:(UIColor *)color andSv:(UIView *)superView;
{
    UILabel *lab = [[UILabel alloc]init];
    lab.backgroundColor = [UIColor whiteColor];
    lab.font = font;
    lab.textColor = color;
    lab.textAlignment = NSTextAlignmentLeft;
    [superView addSubview:lab];
    return lab;
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
