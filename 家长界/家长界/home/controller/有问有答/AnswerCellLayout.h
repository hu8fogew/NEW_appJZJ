//
//  AnswerCellLayout.h
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "LWLayout.h"
#import "AnswerModel.h"


#define MESSAGE_TYPE_IMAGE @"image"
#define MESSAGE_TYPE_VIDEO @"video"
#define AVATAR_IDENTIFIER @"avatar"
#define IMAGE_IDENTIFIER @"image"
#define WEBSITE_COVER_IDENTIFIER @"cover"


@interface AnswerCellLayout : LWLayout <NSCopying>
@property (nonatomic,strong) AnswerModel* statusModel;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) CGRect lineRect;
@property (nonatomic,assign) CGRect menuPosition;
@property (nonatomic,assign) CGRect commentBgPosition;
@property (nonatomic,assign) CGRect avatarPosition;
@property(nonatomic,assign) CGRect enjoyPosition;

//文字过长时，折叠状态的布局模型
- (id)initWithStatusModel:(AnswerModel *)stautsModel
                    index:(NSInteger)index
            dateFormatter:(NSDateFormatter *)dateFormatter;


//文字过长时，打开状态的布局模型
- (id)initContentOpendLayoutWithStatusModel:(AnswerModel *)stautsModel
                                      index:(NSInteger)index
                              dateFormatter:(NSDateFormatter *)dateFormatter;
@end
