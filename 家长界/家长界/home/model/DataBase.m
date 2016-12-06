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
                          @"哈偶次不如我v 人 vv 认为 vu 人",@"mainTitle",
                          @"孩子上学不上进怎么办，上学总是逃课",@"smallTitle",
                          @"0评",@"commentTitle",
                          nil];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"聂 uvi 被 uivrewire此饿哦 v 别人",@"mainTitle",
                          @"你好饿你微博为 vui 让我把 v",@"smallTitle",
                          @"1评",@"commentTitle",
                          
                          nil];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"u 认为 i 哦博瑞强哦 v 被 v",@"mainTitle",
                          @"UI为 v 哦吧瑞 v 哦 v 背后 v",@"smallTitle",
                          @"2评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"u 开发愉快 v 湖 v 看愉快 v 鱼u 看",@"mainTitle",
                          @"v 愉快 v 贺绿汀日产途营销人员",@"smallTitle",
                          @"3评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"v 预防梯电梯开发有太多太容易哭",@"mainTitle",
                          @"铁道游击队以后，投入大图看的人通常光滑",@"smallTitle",
                          @"4评",@"commentTitle",
                          
                          nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"反对托卡耶夫遇到风雨里放一到体育课",@"mainTitle",
                          @"为她额头好想发图的停车费",@"smallTitle",
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
