//
//  AnswerModel.h
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnswerModel : NSObject<NSCopying>

@property (nonatomic,copy) NSString* type;
@property (nonatomic,strong) NSURL* avatar;
@property (nonatomic,copy) NSString* content;
@property (nonatomic,copy) NSString* detail;
@property (nonatomic,strong) NSDate* date;
@property (nonatomic,copy) NSString* name;
@property (nonatomic,strong) NSNumber* statusID;

- (AnswerModel *)initWithDict:(NSDictionary *)dict;


@end
