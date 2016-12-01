//
//  DataBase.h
//  家长界
//
//  Created by mac on 16/11/4.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject
@property(nonatomic,copy)NSString *slecteImg;
@property(nonatomic,copy)NSString *labTiltle;
@property(nonatomic,copy)NSString *lunboImg;

+(NSMutableArray *)addArray;
/*首页选择按钮的数组*/
+(NSMutableArray *)addSelecteArray;

/*周边教育的选择按钮数组*/

+(NSMutableArray *)addSelecArray;


/*有问有答*/
+(NSMutableArray *)addSeleBarArray;
/*企聘通的首页选择按钮*/
+(NSMutableArray *)addQptSeleBarArray;
@end
