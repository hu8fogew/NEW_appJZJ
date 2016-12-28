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


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = HWColor(232, 232, 232);
        [self.contentView addSubview:self.asyncView];
    }
    return self;
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
