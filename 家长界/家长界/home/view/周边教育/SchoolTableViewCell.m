//
//  SchoolTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "SchoolTableViewCell.h"

@interface SchoolTableViewCell()

@property(nonatomic,strong)UIView *vi;

@end

@implementation SchoolTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = HWColor(242, 242, 242);
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        self.vi = vi;
        vi.backgroundColor = [UIColor whiteColor];
        /*cell的自定纯代码布局*/
        self.logoView = [[UIImageView alloc]init];
        CALayer *layer = [self.logoView layer];
        [layer setMasksToBounds:YES];
        
        [layer setBorderWidth:1];
        
        [layer setBorderColor:[HWColor(210, 210, 210) CGColor]];
        
        self.logoView.frame = CGRectMake(10, 20, vi.frame.size.height-40, vi.frame.size.height-40);
        self.schoolMainLable = [[UILabel alloc]initWithFrame:CGRectMake(self.logoView.x+self.logoView.width+5, 20, SCREEN_WIDTH-self.logoView.width-130, self.logoView.height/3)];
        self.schoolMainLable.font = [UIFont systemFontOfSize:16];
        self.smallImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.schoolMainLable.x + self.schoolMainLable.width, 23, self.schoolMainLable.height-5, self.schoolMainLable.height-5)];
        
        self.distanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(vi.width-40, 20, 40, self.schoolMainLable.height)];
        self.distanceLabel.font = [UIFont systemFontOfSize:13];
        self.distanceLabel.textColor = HWColor(152, 152, 152);
        
        
        self.mapImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.distanceLabel.x - self.smallImageView.width, 23, self.smallImageView.width, self.smallImageView.height)];
        
        self.schoolOtherLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.schoolMainLable.x, self.schoolMainLable.y+self.schoolMainLable.height, vi.width-self.schoolMainLable.x, self.schoolMainLable.height)];
        self.schoolOtherLabel.font = [UIFont systemFontOfSize:13];
        self.schoolOtherLabel.textColor = HWColor(152, 152, 152);
        
        
        self.schoolKindView = [[UIView alloc]initWithFrame:CGRectMake(self.schoolMainLable.x, self.schoolOtherLabel.y+self.schoolOtherLabel.height+4, self.schoolOtherLabel.width, self.schoolOtherLabel.height-5)];
        
        
        [vi addSubview:self.schoolKindView];
        [vi addSubview:self.schoolOtherLabel];
        [vi addSubview:self.mapImageView];
        [vi addSubview:self.distanceLabel];
        [vi addSubview:self.smallImageView];
        [vi addSubview:self.schoolMainLable];
        [vi addSubview:self.logoView];
        [self addSubview: vi];
        
        
    }
    
    return self;
}

/*
-(void)createSchoolKindLabelWithArr:(NSArray *)arr
{
    for (int i = 0; i<arr.count; i++) {
        
        self.schoolKindLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.schoolMainLable.x +i*(self.schoolOtherLabel.height + 20+10), self.schoolOtherLabel.y+self.schoolOtherLabel.height, self.schoolOtherLabel.height + 20, self.schoolOtherLabel.height)];
        self.schoolKindLabel.layer.borderWidth = 0.8;
        self.schoolKindLabel.layer.borderColor = (__bridge CGColorRef _Nullable)(HWColor(136, 198, 192));
        self.schoolKindLabel.layer.masksToBounds = YES;
        [self.vi addSubview:self.schoolKindLabel];
    }
}

*/


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
