//
//  DataBase.m
//  家长界
//
//  Created by mac on 16/11/4.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase

+(NSMutableArray *)addArray
{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<3; i ++) {
        NSString *str = [NSString stringWithFormat:@"%zd",i];
        
        [array addObject:str];
        
    }
    
    return [array copy];
}

+(NSMutableArray *)addSelecteArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"4",@"slecteImg",
                          @"家长课堂",@"labTitle",
                          @"1",@"lunboImg",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"5",@"slecteImg",
                          @"有问有答",@"labTitle",
                          @"2",@"lunboImg",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"6",@"slecteImg",
                          @"亲子天地",@"labTitle",
                          @"3",@"lunboImg",
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    return [arr copy];
    
}


+(NSMutableArray *)addSelecArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"11",@"slecteImg",
                          @"文化",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"12",@"slecteImg",
                          @"艺术",@"labTitle",

                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"13",@"slecteImg",
                          @"体育",@"labTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"14",@"slecteImg",
                          @"科技",@"labTitle",
                          
                          nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"15",@"slecteImg",
                          @"托管",@"labTitle",
                          
                          nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"16",@"slecteImg",
                          @"特色教育",@"labTitle",
                          
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    [arr addObject:dic4];
    [arr addObject:dic5];
    [arr addObject:dic6];
    return [arr copy];
    
}


+(NSMutableArray *)addQptSeleBarArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"ycym_image",@"slecteImg",
                          @"有才有貌",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"qzsp_image",@"slecteImg",
                          @"全职速聘",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"jzdr_image",@"slecteImg",
                          @"兼职达人",@"labTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"hwly_image",@"slecteImg",
                          @"海外猎鹰",@"labTitle",
                          
                          nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"xy365_image",@"slecteImg",
                          @"校园365",@"labTitle",
                          
                          nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"zph_image",@"slecteImg",
                          @"招聘会",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic7 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"mqzx_image",@"slecteImg",
                          @"名企在线",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic8 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"ytxy_image",@"slecteImg",
                          @"易通学院",@"labTitle",
                          
                          nil];
    
    
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    [arr addObject:dic4];
    [arr addObject:dic5];
    [arr addObject:dic6];
    
    [arr addObject:dic7];
    [arr addObject:dic8];
    
    
    return [arr copy];
    
}


+(NSMutableArray *)addSeleBarArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"4",@"slecteImg",
                          @"家长教育",@"labTitle",
                          @"1",@"lunboImg",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"5",@"slecteImg",
                          @"学习烦恼",@"labTitle",
                          @"2",@"lunboImg",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"6",@"slecteImg",
                          @"生理健康",@"labTitle",
                          @"3",@"lunboImg",
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    return [arr copy];
    
}

@end
