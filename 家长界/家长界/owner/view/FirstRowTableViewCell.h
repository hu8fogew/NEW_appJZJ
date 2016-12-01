//
//  FirstRowTableViewCell.h
//  家长界
//
//  Created by 张波 on 2016/11/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstRowTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *personLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *personFansLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyFansLabel;
@property (weak, nonatomic) IBOutlet UIView *personView;
@property (weak, nonatomic) IBOutlet UIView *companyView;
@property (weak, nonatomic) IBOutlet UIView *personFansView;
@property (weak, nonatomic) IBOutlet UIView *companyFansView;

@end
