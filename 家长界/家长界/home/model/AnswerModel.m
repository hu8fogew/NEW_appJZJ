//
//  AnswerModel.m
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerModel.h"

@implementation AnswerModel
- (id)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.type = dict[@"type"];
        self.avatar = [NSURL URLWithString:dict[@"avatar"]];
        self.content = dict[@"content"];
        self.detail = dict[@"detail"];
        self.date = [NSDate dateWithTimeIntervalSince1970:[dict[@"date"] floatValue]];
        self.name = dict[@"name"];
        self.statusID = dict[@"statusID"];
        
    }
    return self;
}


- (id)copyWithZone:(NSZone *)zone {
    AnswerModel* one = [[AnswerModel alloc] init];
    one.type = [self.type copy];
    one.avatar = [self.avatar copy];
    one.content = [self.content copy];
    one.detail = [self.detail copy];
    one.date = [self.date copy];
    one.name = [self.name copy];
    one.statusID = [self.statusID copy];
    return one;
}

@end
