//
//  PhotoViewCell.h
//  家长界
//
//  Created by mac on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHWorkGroupPhotoContainer;
@interface PhotoViewCell : UITableViewCell

//@property(nonatomic,strong)UIImageView *imageVF;
@property(nonatomic,strong)YHWorkGroupPhotoContainer *picContainerView;

@property(nonatomic,strong)NSArray *arrUrl;
//@property(nonatomic,strong)UIImageView *imageArr;

@end
