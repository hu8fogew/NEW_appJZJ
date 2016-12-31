//
//  TeachDescLayout.h
//  家长界
//
//  Created by mac on 2016/12/31.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "LWLayout.h"

@interface TeachDescLayout : LWLayout<NSCopying>

@property(nonatomic,assign) CGFloat descViewHeight;

//老师描述的view
-(id)initDescTeacherView;
@end
