//
//  AnswerQuestionCell.m
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerQuestionCell.h"
#import "LWImageStorage.h"
#import "LWAlertView.h"
#import "YHWorkGroupButton.h"


@interface AnswerQuestionCell ()<LWAsyncDisplayViewDelegate>


@property (nonatomic,strong) LWAsyncDisplayView* asyncDisplayView;
//打赏按钮
@property (nonatomic,strong) UIButton* awardButton;
//点赞按钮
@property(nonatomic,strong) UIButton *enjoyButton;
@property(nonatomic,strong)YHWorkGroupButton *enjoyBtn;
@property (nonatomic,copy) NSString* preCopyText;
@property (nonatomic,copy) NSString* numText;

@end

@implementation AnswerQuestionCell




#pragma mark - Init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = HWColor(232, 232, 232);
        [self.contentView addSubview:self.asyncDisplayView];
        [self.contentView addSubview:self.awardButton];
        [self.contentView addSubview:self.enjoyButton];
    }
    return self;
}

#pragma mark - LWAsyncDisplayViewDelegate

//额外的绘制
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
//点击LWImageStorage
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView
   didCilickedImageStorage:(LWImageStorage *)imageStorage
                     touch:(UITouch *)touch{
    NSInteger tag = imageStorage.tag;
    //tag 0~8 是图片，9是头像
    switch (tag) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:{
            if (self.clickedImageCallback) {
                self.clickedImageCallback(self,tag);
            }
        }break;
        case 9: {
            if (self.clickedAvatarCallback) {
                self.clickedAvatarCallback(self);
            }
        }break;
    }
}

//点击LWTextStorage
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView
    didCilickedTextStorage:(LWTextStorage *)textStorage
                  linkdata:(id)data {
    //回复评论
    if ([data isKindOfClass:[NSString class]]) {
        //折叠Cell
        if ([data isEqualToString:@"close"]) {
            if (self.clickedCloseCellCallback) {
                self.clickedCloseCellCallback(self);
            }
        }
        //展开Cell
        else if ([data isEqualToString:@"open"]) {
            if (self.clickedOpenCellCallback) {
                self.clickedOpenCellCallback(self);
            }
        }
        //其他
        else {
            [LWAlertView shoWithMessage:data];
        }
    }
}
#pragma mark - Actions
//点赞按钮
-(void)enjoyClickedBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (self.clickedEnjoyBtn) {
        self.clickedEnjoyBtn(self);
    }
    
}


//打赏
- (void)didClickedMenuButton {
    if (self.clickedLikeBtn) {
        self.clickedLikeBtn(self);
    }
}
#pragma mark -

- (void)layoutSubviews {
    [super layoutSubviews];
    self.asyncDisplayView.frame = CGRectMake(0,0,SCREEN_WIDTH,self.cellLayout.cellHeight);
    
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    self.awardButton.frame = self.cellLayout.menuPosition;
    self.enjoyButton.frame = self.cellLayout.enjoyPosition;
}

- (void)setCellLayout:(AnswerCellLayout *)cellLayout {
    if (_cellLayout != cellLayout) {
        _cellLayout = cellLayout;
        self.asyncDisplayView.layout = self.cellLayout;
        
        //主线程runloop空闲时执行
        LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
        [layerAsyncTransaction
         addAsyncOperationWithTarget:self
         selector:@selector(_setCellLayout)
         object:nil
         completion:^(BOOL canceled) {}];
    }
}

- (void)_setCellLayout {
    
}

#pragma mark - Getter

- (LWAsyncDisplayView *)asyncDisplayView {
    if (_asyncDisplayView) {
        return _asyncDisplayView;
    }
    _asyncDisplayView = [[LWAsyncDisplayView alloc] initWithFrame:CGRectZero];
    _asyncDisplayView.delegate = self;
    return _asyncDisplayView;
}

- (UIButton *)awardButton {
    if (_awardButton) {
        return _awardButton;
    }
    _awardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_awardButton setImage:[UIImage imageNamed:@"award_image"] forState:UIControlStateNormal];
    _awardButton.imageEdgeInsets = UIEdgeInsetsMake(14.5f, 12.0f, 14.5f, 12.0f);
    [_awardButton addTarget:self action:@selector(didClickedMenuButton)
           forControlEvents:UIControlEventTouchUpInside];
    return _awardButton;
}

-(UIButton *)enjoyButton
{
    if (!_enjoyButton) {
        _enjoyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_enjoyButton setTitle:@"0" forState:UIControlStateNormal];
        [_enjoyButton setTitle:@"1" forState:UIControlStateSelected];
        [_enjoyButton setImage:[UIImage imageNamed:@"timeline_icon_unlike"] forState:UIControlStateNormal];
        [_enjoyButton setImage:[UIImage imageNamed:@"timeline_icon_like"] forState:UIControlStateSelected];
        [_enjoyButton addTarget:self action:@selector(enjoyClickedBtn:) forControlEvents:UIControlEventTouchUpInside];
//        _enjoyButton.backgroundColor = [UIColor purpleColor];
    }
    return _enjoyButton;
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
