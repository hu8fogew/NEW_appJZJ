//
//  ParentSelectView.m
//  家长界
//
//  Created by mac on 2016/11/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ParentSelectView.h"
@interface ParentSelectView()<SGSegmentedControlDelegate>

@property(nonatomic,strong)SGSegmentedControl *SG;

@end

@implementation ParentSelectView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self setupSegementControl];
        
    }
    return self;
}



-(void)setupSegementControl
{
    
    NSArray *arr = @[@"介绍",@"目录",@"评价"];
    
    self.SG = [SGSegmentedControl segmentedControlWithFrame:self.frame delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arr];
    
    self.SG.titleColorStateSelected = HWColor(147, 200, 234);
    self.SG.indicatorColor = HWColor(147, 200, 234);
    
    [self addSubview:self.SG];
    
}


#pragma mark SGSegmentedControlDelegate

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    
    if (index == 0) {
        HWLog(@"0");
    }
    
    if (index == 1) {
        HWLog(@"1");
        
    }
    
    if (index == 2) {
        HWLog(@"2");
    }
    
}

@end
