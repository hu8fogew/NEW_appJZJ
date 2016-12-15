//
//  OwnerDate.m
//  家长界
//
//  Created by mac on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "OwnerDate.h"

@implementation OwnerDate



+(instancetype)shareManger
{
    static OwnerDate *data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[OwnerDate alloc]init];
    });
    return data;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



+(NSArray *)staticArrayForOwnerDate
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的动态",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的问题",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的回答",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的咨询",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的报名",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的观看记录",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic7 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的通币",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic8 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的观看记录",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic9 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的收支",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    NSDictionary *dic0 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"招聘助手",@"kindTitle",
                          @"placehode_icon",@"kindImage",
                          nil];
    
    [array addObject:dic1];
    [array addObject:dic2];
    [array addObject:dic3];
    
    [array addObject:dic4];
    [array addObject:dic5];
    [array addObject:dic6];
    
    [array addObject:dic7];
    [array addObject:dic8];
    [array addObject:dic9];
    [array addObject:dic0];
    
    return [array copy];
}


@end
