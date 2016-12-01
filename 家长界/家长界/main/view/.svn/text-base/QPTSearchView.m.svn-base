//
//  QPTSearchView.m
//  家长界
//
//  Created by mac on 2016/11/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QPTSearchView.h"

@implementation QPTSearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
     
        //设置地区名
        
        _areaText = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        _areaText.font = [UIFont systemFontOfSize:16];
        _areaText.textColor = HWColor(53, 53, 53);
        _areaText.backgroundColor = [UIColor whiteColor];
        _areaText.textAlignment = NSTextAlignmentRight;
        [self addSubview:_areaText];
        //设置按钮的属性
        _areaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _areaButton.selected = NO;
        //为选中的图片
        [_areaButton setImage:[UIImage imageNamed:@"pull"] forState:UIControlStateNormal];
        //选中的图片
        [_areaButton setImage:[UIImage imageNamed:@"push"] forState:UIControlStateSelected];
        [_areaButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, _areaButton.width/2)];
        _areaButton.selected = NO;
        
//        _areaButton.backgroundColor = [UIColor purpleColor];
        [_areaButton addTarget:self action:@selector(areaBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_areaButton];
        
        _searchText = [HWSearchBar searchBar];
        
        _searchText.backgroundColor = HWColor(241, 241, 241);
        _searchText.layer.cornerRadius = 4;
        [self addSubview:_searchText];
        
        
    }
    return self;
}


-(void)areaBtnClick
{
    _areaButton.selected = !_areaButton.selected;
    HWLog(@"西安");
}



@end
