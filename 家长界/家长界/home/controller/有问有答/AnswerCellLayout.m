//
//  AnswerCellLayout.m
//  家长界
//
//  Created by mac on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AnswerCellLayout.h"
#import "LWTextParser.h"
@implementation AnswerCellLayout
- (id)copyWithZone:(NSZone *)zone {
    AnswerCellLayout* one = [[AnswerCellLayout alloc] init];
    one.statusModel = [self.statusModel copy];
    one.cellHeight = self.cellHeight;
    one.lineRect = self.lineRect;
    one.menuPosition = self.menuPosition;
    one.commentBgPosition = self.commentBgPosition;
    one.avatarPosition = self.avatarPosition;
    return one;
}


- (id)initWithStatusModel:(AnswerModel *)statusModel
                    index:(NSInteger)index
            dateFormatter:(NSDateFormatter *)dateFormatter {
    self = [super init];
    if (self) {
        self.statusModel = statusModel;
        //头像模型 avatarImageStorage
        LWImageStorage* avatarStorage = [[LWImageStorage alloc] initWithIdentifier:AVATAR_IDENTIFIER];
        avatarStorage.contents = statusModel.avatar;
        avatarStorage.cornerRadius = 20.0f;
        avatarStorage.cornerBackgroundColor = [UIColor whiteColor];
        avatarStorage.backgroundColor = [UIColor whiteColor];
        avatarStorage.frame = CGRectMake(10, 20, 40, 40);
        avatarStorage.tag = 9;
        avatarStorage.cornerBorderWidth = 1.0f;
        avatarStorage.cornerBorderColor = [UIColor grayColor];
        
        //名字模型 nameTextStorage
        LWTextStorage* nameTextStorage = [[LWTextStorage alloc] init];
        nameTextStorage.text = statusModel.name;
        nameTextStorage.font = [UIFont systemFontOfSize:17];
        nameTextStorage.textColor = HWColor(52, 52, 52);
        nameTextStorage.frame = CGRectMake(60.0f, 20.0f, SCREEN_WIDTH - 100.0f, CGFLOAT_MAX);
//        [nameTextStorage lw_addLinkWithData:[NSString stringWithFormat:@"%@",statusModel.name]
//                                      range:NSMakeRange(0,statusModel.name.length)
//                                  linkColor:RGB(113, 129, 161, 1)
//                             highLightColor:RGB(0, 0, 0, 0.15)];
//        
        
        //正文内容模型 contentTextStorage
        LWTextStorage* contentTextStorage = [[LWTextStorage alloc] init];
        contentTextStorage.maxNumberOfLines = 3;//设置最大行数，超过则折叠
        contentTextStorage.text = statusModel.content;
        contentTextStorage.font = [UIFont systemFontOfSize:16];
        contentTextStorage.textColor = HWColor(80, 80, 80);
        contentTextStorage.textColor = RGB(40, 40, 40, 1);
        contentTextStorage.frame = CGRectMake(nameTextStorage.left,
                                              nameTextStorage.bottom + 10.0f,
                                              SCREEN_WIDTH - 80.0f,
                                              CGFLOAT_MAX);
        
        //生成时间的模型 dateTextStorage
        LWTextStorage* dateTextStorage = [[LWTextStorage alloc] init];
        dateTextStorage.text = [dateFormatter stringFromDate:statusModel.date];
        dateTextStorage.font = [UIFont systemFontOfSize:13];
        dateTextStorage.textColor = HWColor(153, 153, 153);
        dateTextStorage.frame = CGRectMake(nameTextStorage.left,
                                           contentTextStorage.bottom + 10.0f,
                                           SCREEN_WIDTH - 80.0f,
                                           CGFLOAT_MAX);
        
        //菜单按钮
        CGRect menuPosition = CGRectZero;
        if (![statusModel.type isEqualToString:MESSAGE_TYPE_VIDEO]) {
            menuPosition = CGRectMake(SCREEN_WIDTH - 75.0f,
                                      10.0f + contentTextStorage.bottom - 14.5f,
                                      65.0f,
                                      50.0f);
            
            
        }
        
        CGFloat contentBottom = contentTextStorage.bottom;
        //折叠的条件
        if (contentTextStorage.isTruncation) {
            contentTextStorage.frame = CGRectMake(nameTextStorage.left,
                                                  nameTextStorage.bottom + 10.0f,
                                                  SCREEN_WIDTH - 80.0f,
                                                  CGFLOAT_MAX);
            
            LWTextStorage* openStorage = [[LWTextStorage alloc] init];
            openStorage.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
            openStorage.textColor = RGB(40, 40, 40, 1);
            openStorage.frame = CGRectMake(nameTextStorage.left,
                                           contentTextStorage.bottom + 5.0f,
                                           200.0f,
                                           30.0f);
            openStorage.text = @"展开全文";
            [openStorage lw_addLinkWithData:@"open"
                                      range:NSMakeRange(0, 4)
                                  linkColor:RGB(113, 129, 161, 1)
                             highLightColor:RGB(0, 0, 0, 0.15f)];
            [self addStorage:openStorage];
            contentBottom = openStorage.bottom;
            
            dateTextStorage.frame = CGRectMake(nameTextStorage.left,
                                               openStorage.bottom + 10.0f,
                                               SCREEN_WIDTH - 80.0f,
                                               CGFLOAT_MAX);
            menuPosition = CGRectMake(SCREEN_WIDTH - 75.0f,
                                      10.0f + openStorage.bottom - 14.5f,
                                      65.0f,
                                      50.0f);
        }
        //解析表情和主题
        //解析表情、主题、网址
        [LWTextParser parseEmojiWithTextStorage:contentTextStorage];
        [LWTextParser parseTopicWithLWTextStorage:contentTextStorage
                                        linkColor:RGB(113, 129, 161, 1)
                                   highlightColor:RGB(0, 0, 0, 0.15)];
        [LWTextParser parseHttpURLWithTextStorage:contentTextStorage
                                        linkColor:RGB(113, 129, 161, 1)
                                   highlightColor:RGB(0, 0, 0, 0.15f)];
        
        
        
        
        [self addStorage:nameTextStorage];//将Storage添加到遵循LWLayoutProtocol协议的类
        [self addStorage:contentTextStorage];
        [self addStorage:dateTextStorage];
        //通过一个数组来添加storage，使用这个方法
        [self addStorage:avatarStorage];
        self.avatarPosition = CGRectMake(10, 20, 40, 40);//头像的位置
        self.menuPosition = menuPosition;//右下角菜单按钮的位置
        //如果是使用在UITableViewCell上面，可以通过以下方法快速的得到Cell的高度
        self.enjoyPosition = CGRectMake(SCREEN_WIDTH-60, nameTextStorage.top, 40, 20);
        self.cellHeight = [self suggestHeightWithBottomMargin:15.0f];
    }
    return self;
}

- (id)initContentOpendLayoutWithStatusModel:(AnswerModel *)statusModel
                                      index:(NSInteger)index
                              dateFormatter:(NSDateFormatter *)dateFormatter {
    self = [super init];
    if (self) {
        self.statusModel = statusModel;
        //头像模型 avatarImageStorage
        LWImageStorage* avatarStorage = [[LWImageStorage alloc] initWithIdentifier:AVATAR_IDENTIFIER];
        avatarStorage.contents = statusModel.avatar;
        avatarStorage.cornerRadius = 20.0f;
        avatarStorage.cornerBackgroundColor = [UIColor whiteColor];
        avatarStorage.backgroundColor = [UIColor whiteColor];
        avatarStorage.frame = CGRectMake(10, 20, 40, 40);
        avatarStorage.tag = 9;
        avatarStorage.cornerBorderWidth = 1.0f;
        avatarStorage.cornerBorderColor = [UIColor grayColor];
        
        //名字模型 nameTextStorage
        LWTextStorage* nameTextStorage = [[LWTextStorage alloc] init];
        nameTextStorage.text = statusModel.name;
        nameTextStorage.font = [UIFont systemFontOfSize:17];
        nameTextStorage.textColor = HWColor(52, 52, 52);
        nameTextStorage.frame = CGRectMake(60.0f, 20.0f, SCREEN_WIDTH - 80.0f, CGFLOAT_MAX);
//        [nameTextStorage lw_addLinkWithData:[NSString stringWithFormat:@"%@",statusModel.name]
//                                      range:NSMakeRange(0,statusModel.name.length)
//                                  linkColor:RGB(113, 129, 161, 1)
//                             highLightColor:RGB(0, 0, 0, 0.15)];
        
        //正文内容模型 contentTextStorage
        LWTextStorage* contentTextStorage = [[LWTextStorage alloc] init];
        contentTextStorage.text = statusModel.content;
        contentTextStorage.font = [UIFont systemFontOfSize:16];
        contentTextStorage.textColor = HWColor(80, 80, 80);
        contentTextStorage.frame = CGRectMake(nameTextStorage.left,
                                              nameTextStorage.bottom + 10.0f,
                                              SCREEN_WIDTH - 80.0f,
                                              CGFLOAT_MAX);
        
        //折叠文字
        LWTextStorage* closeStorage = [[LWTextStorage alloc] init];
        closeStorage.font = [UIFont fontWithName:@"Heiti SC" size:15.0f];
        closeStorage.textColor = RGB(40, 40, 40, 1);
        closeStorage.frame = CGRectMake(nameTextStorage.left,
                                        contentTextStorage.bottom + 5.0f,
                                        200.0f,
                                        30.0f);
        closeStorage.text = @"收起全文";
        [closeStorage lw_addLinkWithData:@"close"
                                   range:NSMakeRange(0, 4)
                               linkColor:RGB(113, 129, 161, 1)
                          highLightColor:RGB(0, 0, 0, 0.15f)];
        [self addStorage:closeStorage];
        //解析表情、主题、网址
        [LWTextParser parseEmojiWithTextStorage:contentTextStorage];
        [LWTextParser parseTopicWithLWTextStorage:contentTextStorage
                                        linkColor:RGB(113, 129, 161, 1)
                                   highlightColor:RGB(0, 0, 0, 0.15)];
        [LWTextParser parseHttpURLWithTextStorage:contentTextStorage
                                        linkColor:RGB(113, 129, 161, 1)
                                   highlightColor:RGB(0, 0, 0, 0.15f)];
        
        //生成时间的模型 dateTextStorage
        LWTextStorage* dateTextStorage = [[LWTextStorage alloc] init];
        dateTextStorage.text = [dateFormatter stringFromDate:statusModel.date];
        dateTextStorage.font = [UIFont systemFontOfSize:13];
        dateTextStorage.textColor = HWColor(153, 153, 153);
        dateTextStorage.frame = CGRectMake(nameTextStorage.left,
                                           closeStorage.bottom + 10.0f,
                                           SCREEN_WIDTH - 80.0f,
                                           CGFLOAT_MAX);
        //菜单按钮
        CGRect menuPosition = CGRectZero;
        if (![statusModel.type isEqualToString:@"video"]) {
            menuPosition = CGRectMake(SCREEN_WIDTH - 75.0f,
                                      10.0f + closeStorage.bottom - 14.5f,
                                      65.0f,
                                      50.0f);
            
            
        }
        
        
        [self addStorage:nameTextStorage];//将Storage添加到遵循LWLayoutProtocol协议的类
        [self addStorage:contentTextStorage];
        [self addStorage:dateTextStorage];
        [self addStorage:avatarStorage];
        self.avatarPosition = CGRectMake(10, 20, 40, 40);//头像的位置
        self.menuPosition = menuPosition;//右下角菜单按钮的位置
        //如果是使用在UITableViewCell上面，可以通过以下方法快速的得到Cell的高度
        self.enjoyPosition = CGRectMake(SCREEN_WIDTH-60, nameTextStorage.top, 40, 20);
        self.cellHeight = [self suggestHeightWithBottomMargin:15.0f];
    }
    return self;
    
}

@end
