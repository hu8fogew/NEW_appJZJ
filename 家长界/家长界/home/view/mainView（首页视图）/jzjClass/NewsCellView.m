//
//  NewsCellView.m
//  家长界
//
//  Created by mac on 2016/11/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "NewsCellView.h"

@interface NewsCellView()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIView *headerView;
@end

@implementation NewsCellView

static NSString *cellId = @"identifier" ;

static NSString *headerId = @"headerId" ;

-(instancetype)initWithFrame:(CGRect)frame 
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layoutView = [[UICollectionViewFlowLayout alloc]init];
        layoutView.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 60);
        
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.headerView.frame.size.height, SCREEN_WIDTH, 360) collectionViewLayout:layoutView];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.collectionView];
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"NewsCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellId];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    }
    return self;
}



/*headerView的内容添加*/
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId forIndexPath:indexPath];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [button setTitle:self.str forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(clickNewsCellAction) forControlEvents:UIControlEventTouchUpInside];
    button.tintColor = [UIColor blackColor];
    [button setBackgroundImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
    [headerView addSubview:button];
    return headerView;
}


-(void)clickNewsCellAction
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hotClass" object:nil userInfo:nil];
    
    
    
    HWLog(@"热门课程");
}


#pragma collectionView的代理协议方法的实现
/*collectionView内容的添加*/
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hotClassCell" object:nil userInfo:nil];
    HWLog(@"%zd",@(indexPath.row).intValue);
}



#pragma mark collectionViewFlowLayoutDelegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((SCREEN_WIDTH-20)/2, 140);
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
