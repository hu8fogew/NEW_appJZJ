//
//  CellForQAList.m
//  github:  https://github.com/samuelandkevin
//  CSDN:  http://blog.csdn.net/samuelandkevin
//  Created by samuelandkevin on 16/8/29.
//  Copyright © 2016年 HKP. All rights reserved.
//

#import "CellForWorkGroup.h"
#import "YHWorkGroupPhotoContainer.h"
#import "YHUserInfoManager.h"

const CGFloat contentLabelFontSize = 13.0;
CGFloat maxContentLabelHeight = 0;  //根据具体font而定
CGFloat kMarginContentLeft    = 10; //动态内容左边边距
CGFloat kMarginContentRight   = 10; //动态内容右边边边距
const CGFloat deleteBtnHeight = 30;
const CGFloat deleteBtnWidth  = 60;
const CGFloat moreBtnHeight   = 30;
const CGFloat moreBtnWidth    = 60;

@interface CellForWorkGroup()<HKPBotViewDelegate>
@property (nonatomic,strong)UIImageView *imgvAvatar;
@property (nonatomic,strong)UILabel     *labelName;
@property (nonatomic,strong)UILabel     *labelIndustry;
@property (nonatomic,strong)UILabel     *labelPubTime;
@property (nonatomic,strong)UILabel     *labelCompany;
@property (nonatomic,strong)UILabel     *labelJob;
@property (nonatomic,strong)UILabel     *labelContent;
@property (nonatomic,strong)UILabel     *labelDelete;
@property (nonatomic,strong)UILabel     *labelMore;

@property (nonatomic,strong)YHWorkGroupPhotoContainer *picContainerView;
@property (nonatomic,strong)UIView      *viewSeparator;
@end

@implementation CellForWorkGroup

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup{
    
    self.imgvAvatar = [UIImageView new];
    self.imgvAvatar.layer.cornerRadius = 22.5;
    self.imgvAvatar.layer.masksToBounds = YES;
    self.imgvAvatar.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGuesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAvatar:)];
    [self.imgvAvatar addGestureRecognizer:tapGuesture];
    [self.contentView addSubview:self.imgvAvatar];
    
    self.labelName  = [UILabel new];
    self.labelName.font = [UIFont systemFontOfSize:14.0f];
    self.labelName.textColor = RGB16(0x303030);
    [self.contentView addSubview:self.labelName];
    
    self.labelIndustry = [UILabel new];
    self.labelIndustry.font = [UIFont systemFontOfSize:12.0f];
    self.labelIndustry.textColor = RGB16(0x303030);
    [self.contentView addSubview:self.labelIndustry];
    
    self.labelPubTime = [UILabel new];
    self.labelPubTime.font = [UIFont systemFontOfSize:13.0f];
    [self.contentView addSubview:self.labelPubTime];
    
    self.labelCompany = [UILabel new];
    self.labelCompany.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:self.labelCompany];
    
    self.labelJob = [UILabel new];
    self.labelJob.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:self.labelJob];
    
    self.labelContent = [UILabel new];
    self.labelContent.font = [UIFont systemFontOfSize:contentLabelFontSize];
    self.labelContent.numberOfLines = 0;
    [self.contentView addSubview:self.labelContent];
    
     self.labelDelete = [UILabel new];
     self.labelDelete.font = [UIFont systemFontOfSize:14.0f];
     self.labelDelete.textColor = HWColor(61, 95, 155);
     self.labelDelete.userInteractionEnabled = YES;
     UITapGestureRecognizer *deleteTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleteTap)];
     [self.labelDelete addGestureRecognizer:deleteTap];
     [self.contentView addSubview:self.labelDelete];
    
     self.labelMore = [UILabel new];
     self.labelMore.font = [UIFont systemFontOfSize:14.0f];
     self.labelMore.textColor = HWColor(0, 191, 143);
     self.labelMore.userInteractionEnabled = YES;
     UITapGestureRecognizer *moreTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMoreTap)];
     [self.labelMore addGestureRecognizer:moreTap];
     [self.contentView addSubview:self.labelMore];
    

    self.picContainerView = [[YHWorkGroupPhotoContainer alloc] initWithWidth:SCREEN_WIDTH-20];
     [self.contentView addSubview:self.picContainerView];
    
     self.viewBottom = [HKPBotView new];
     self.viewBottom.delegate = self;
     [self.contentView addSubview:self.viewBottom];
    
     self.viewSeparator = [UIView new];
     self.viewSeparator.backgroundColor = HWColor(244, 244, 244);
     [self.contentView addSubview:self.viewSeparator];

     [self layoutUI];
    
    //
//    self.labelMore.backgroundColor    = [UIColor yellowColor];
//    self.labelDelete.backgroundColor  = [UIColor blueColor];
//    self.labelContent.backgroundColor = [UIColor redColor];
}

- (void)layoutUI{
      __weak typeof(self)weakSelf = self;
     [self.imgvAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(weakSelf.contentView).offset(15);
         make.left.equalTo(weakSelf.contentView).offset(15);
         make.width.height.mas_equalTo(45);
     }];
    
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).offset(15);
        make.left.equalTo(weakSelf.imgvAvatar.mas_right).offset(10);
        make.right.equalTo(weakSelf.labelIndustry.mas_left).offset(-10);
    }];
   
    
    [self.labelIndustry mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.labelName.mas_bottom);
        make.left.equalTo(weakSelf.labelName.mas_right).offset(10);
        make.right.equalTo(weakSelf.labelPubTime.mas_left).offset(-10);
        make.width.mas_greaterThanOrEqualTo(60);
    }];
    [self.labelIndustry setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisHorizontal];
    [self.labelIndustry setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.labelPubTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.labelName.mas_bottom);
        make.right.equalTo(weakSelf.contentView).offset(-15);
    }];
    [self.labelPubTime setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self.labelPubTime setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisHorizontal];
    

    [self.labelCompany mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.labelName.mas_bottom).offset(9);
        make.left.equalTo(weakSelf.labelName.mas_left);
        make.right.equalTo(weakSelf.labelJob.mas_left).offset(-10);
    }];
    
    [self.labelJob mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.labelCompany.mas_bottom);
        make.left.equalTo(weakSelf.labelCompany.mas_right).offset(10);
        make.right.equalTo(weakSelf.contentView).offset(-10);
        make.width.mas_greaterThanOrEqualTo(80);
    }];
   
    [self.labelJob setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisHorizontal];
    [self.labelJob setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    
    
    [self.labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imgvAvatar.mas_bottom).offset(11);
        make.left.equalTo(weakSelf.contentView).offset(10);
        make.right.equalTo(weakSelf.contentView).offset(-10);
        make.bottom.equalTo(weakSelf.labelMore.mas_top).offset(-11);
    }];

    // 不然在6/6plus上就不准确了
    self.labelContent.preferredMaxLayoutWidth = SCREEN_WIDTH - 20;
    
    
    [self.labelMore mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(weakSelf.labelContent.mas_bottom).offset(11);
        make.left.equalTo(weakSelf.contentView).offset(10);
        make.height.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
    
    [self.labelDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.labelMore.mas_centerY);
        make.left.equalTo(weakSelf.labelMore.mas_right).offset(10);
        make.height.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
    

    [self.picContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.labelMore.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.contentView).offset(10);
        make.height.mas_equalTo(0);
        make.right.mas_greaterThanOrEqualTo(weakSelf.contentView).offset(-10);
    }];
    [self.picContainerView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
    [self.picContainerView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
    
    
    [self.viewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.picContainerView.mas_bottom).offset(15).priorityLow();
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    [self.viewSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.viewBottom.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(15);
        make.bottom.equalTo(weakSelf.contentView);
    }];
    
}


- (void)setModel:(YHWorkGroup *)model{
    _model = model;
    [self.imgvAvatar sd_setImageWithURL:_model.userInfo.avatarUrl placeholderImage:[UIImage imageNamed:@"common_avatar_120px"]];
    self.labelName.text     = _model.userInfo.userName;
    self.labelIndustry.text = _model.userInfo.industry;
    self.labelPubTime.text  = _model.publishTime;
    self.labelCompany.text  = _model.userInfo.company;
    self.labelJob.text      = _model.userInfo.job;
    
    /*************动态内容*************/
    maxContentLabelHeight   = _labelContent.font.pointSize * 4;
    self.labelContent.text  = _model.msgContent;
    WeakSelf
    //查看详情按钮
    self.labelMore.text     = @"查看全部";
    CGFloat moreBtnH = 0;
    if (_model.shouldShowMoreButton) { // 如果文字高度超过60
        moreBtnH = moreBtnHeight;
        
        if (_model.isOpening) { // 如果需要展开
            
            _labelMore.text = @"收起";
            [self.labelContent mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(weakSelf.imgvAvatar.mas_bottom).offset(11);
                make.left.equalTo(weakSelf.contentView).offset(10);
                make.right.equalTo(weakSelf.contentView).offset(-10);
                make.bottom.equalTo(weakSelf.labelMore.mas_top).offset(-11);
            }];
        } else {
            _labelMore.text = @"查看全部";
            [_labelContent mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(maxContentLabelHeight);
                
            }];
        }
    }

    //删除按钮
    self.labelDelete.text   = @"删除";
    CGFloat delBtnH = 0;
    if ([_model.userInfo.uid isEqualToString:[YHUserInfoManager sharedInstance].userInfo.uid]) {
        delBtnH = deleteBtnHeight;
    }

    //更新“查看详情”和“删除按钮”的约束
    [_labelMore mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(moreBtnH);
    }];


    [_labelDelete mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(delBtnH);
        
        if (moreBtnH) {
            make.left.equalTo(weakSelf.labelMore.mas_right).offset(10);
            make.centerY.equalTo(weakSelf.labelMore.mas_centerY);
        }else{
            make.left.equalTo(weakSelf.labelMore.mas_right).offset(-80);
            make.centerY.equalTo(weakSelf.labelMore.mas_centerY).offset(11);
        }
    }];

    
    
    CGFloat picTop = 0;
    if (moreBtnH) {
        picTop = 10;
    }else if(delBtnH && !moreBtnH){
        picTop = 30;
    }else{
        picTop = 0;
    }
    
    [_picContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.labelMore.mas_bottom).offset(picTop);
           
    }];


    self.picContainerView.picUrlArray = _model.thumbnailPicUrls;
    self.picContainerView.picOriArray = _model.originalPicUrls;

    CGFloat viewBottomTop = 0;
    if(_model.thumbnailPicUrls.count){
        viewBottomTop = 15;
    }
    [_viewBottom mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.picContainerView.mas_bottom).offset(viewBottomTop).priorityLow();
    }];

    
    _viewBottom.btnLike.selected = _model.isLike? YES: NO;
    [_viewBottom.btnComment setTitle:[NSString stringWithFormat:@"%d",_model.commentCount] forState:UIControlStateNormal];//评论数
    [_viewBottom.btnLike setTitle:[NSString stringWithFormat:@"%d",_model.likeCount] forState:UIControlStateNormal];          //点赞数
}

#pragma mark - Action
- (void)onMoreTap
{
  
    if (_delegate && [_delegate respondsToSelector:@selector(onMoreInCell:)]) {
        [_delegate onMoreInCell:self];
    }
}

- (void)deleteTap{
    
    if (_delegate && [_delegate respondsToSelector:@selector(onDeleteInCell:)]) {
        [_delegate onDeleteInCell:self];
    }
}

#pragma mark - Gesture

- (void)onAvatar:(UITapGestureRecognizer *)recognizer{
    
    if(recognizer.state == UIGestureRecognizerStateEnded){
        if (_delegate && [_delegate respondsToSelector:@selector(onAvatarInCell:)]) {
            [_delegate onAvatarInCell:self];
        }
    }
}

#pragma mark - HKPBotViewDelegate
- (void)onAvatar{

}

- (void)onMore{

}

- (void)onComment{
    if (_delegate && [_delegate respondsToSelector:@selector(onCommentInCell:)]) {
        [_delegate onCommentInCell:self];
    }
}

- (void)onLike{
    if (_delegate && [_delegate respondsToSelector:@selector(onLikeInCell:)]) {
        [_delegate onLikeInCell:self];
    }
}

- (void)onShare{
    if (_delegate && [_delegate respondsToSelector:@selector(onShareInCell:)]) {
        [_delegate onShareInCell:self];
    }
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
