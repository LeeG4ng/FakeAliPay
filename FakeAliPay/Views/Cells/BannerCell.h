//
//  BannerCell.h
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIPageControl *pageCtrl;

@end
