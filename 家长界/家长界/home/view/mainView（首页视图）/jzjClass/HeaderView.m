//
//  HeaderView.m
//  家长界
//
//  Created by mac on 16/11/7.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "HeaderView.h"
@interface HeaderView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,strong)UICollectionView *hCollectionView;
@property(nonatomic,strong)UIView *hView;
@end

@implementation HeaderView

static NSString *cellId = @"identifier" ;

static NSString *headerId = @"headerId" ;

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layoutView = [[UICollectionViewFlowLayout alloc]init];
        layoutView.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 60);
        
        
       self.hCollectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.hView.frame.size.height, SCREEN_WIDTH, 360) collectionViewLayout:layoutView];
        
        
        self.hCollectionView.delegate = self;
        self.hCollectionView.dataSource = self;
        self.hCollectionView.backgroundColor = [UIColor whiteColor];
        self.hCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.hCollectionView];
        
        [self.hCollectionView registerNib:[UINib nibWithNibName:@"NewsSecondCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellId];
        [self.hCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
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
    [button addTarget:self action:@selector(clickHeaderViewButtonAction) forControlEvents:UIControlEventTouchUpInside];
    button.tintColor = [UIColor blackColor];
    [button setBackgroundImage:[UIImage imageNamed:@"7"] forState:UIControlStateNormal];
    [headerView addSubview:button];
    return headerView;
}

-(void)clickHeaderViewButtonAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hotlife" object:nil userInfo:nil];
    HWLog(@"热门生活");
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
    NewsSecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    return cell;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HWLog(@"%zd",@(indexPath.row).intValue);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hotWife" object:nil userInfo:nil];
    
    
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
