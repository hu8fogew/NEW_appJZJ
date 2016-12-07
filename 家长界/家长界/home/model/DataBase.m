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
                          @"JzKt_icon",@"slecteImg",
                          @"家长课堂",@"labTitle",
                          @"1",@"lunboImg",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"YwYd_icon",@"slecteImg",
                          @"有问有答",@"labTitle",
                          @"2",@"lunboImg",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"QzTd_icon",@"slecteImg",
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
                          @"Wh_icon",@"slecteImg",
                          @"文化",@"labTitle",
                          
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Ys_icon",@"slecteImg",
                          @"艺术",@"labTitle",

                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Ty_icon",@"slecteImg",
                          @"体育",@"labTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Kj_icon",@"slecteImg",
                          @"科技",@"labTitle",
                          
                          nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Tg_icon",@"slecteImg",
                          @"托管",@"labTitle",
                          
                          nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Jy_icon",@"slecteImg",
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
                          @"homeTeach_icon",@"slecteImg",
                          @"家长教育",@"labTitle",
                          @"1",@"lunboImg",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"learn_icon",@"slecteImg",
                          @"学习烦恼",@"labTitle",
                          @"2",@"lunboImg",
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"body_icon",@"slecteImg",
                          @"生理健康",@"labTitle",
                          @"3",@"lunboImg",
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    return [arr copy];
    
}

+(NSMutableArray *)addAdverArray
{
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"张苗是如何变美丽的？",@"mainTitle",
                          @"百度知道",@"smallTitle",
                          @"0评",@"commentTitle",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"张苗胖一斤？",@"mainTitle",
                          @"因为吃了老张家油糕",@"smallTitle",
                          @"1评",@"commentTitle",
                          
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"张苗瘦四斤？",@"mainTitle",
                          @"因为喝老王家瘦身药水！",@"smallTitle",
                          @"2评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"张苗的美丽是如何炼成的？",@"mainTitle",
                          @"每天爬16楼，一口气！能做到吗？",@"smallTitle",
                          @"3评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"愿天堂没有肥胖，只有苗条！",@"mainTitle",
                          @"要么胖死，要么漂亮",@"smallTitle",
                          @"4评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"张苗老师教你如何变瘦",@"mainTitle",
                          @"请百度张苗老师，付款知道哦！",@"smallTitle",
                          @"5评",@"commentTitle",
                          
                          nil];
    [arr addObject:dic1];
    [arr addObject:dic2];
    [arr addObject:dic3];
    [arr addObject:dic4];
    [arr addObject:dic5];
    [arr addObject:dic6];
    return [arr copy];
    
}


@end
