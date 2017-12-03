//
//  BannerCell.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "BannerCell.h"
#import "CollectionViewCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define MAX_SECTIONS 100

@implementation BannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layout];
    }
    return self;
}

- (void)layout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, 90);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    [self.contentView addSubview:_collectionView];
    
    static NSString *id = @"id";
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:id];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:MAX_SECTIONS/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, 75, 30, 10)];
    _pageCtrl.pageIndicatorTintColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.00];
    _pageCtrl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.30 green:0.66 blue:0.95 alpha:1.00];
    _pageCtrl.enabled = NO;
    _pageCtrl.numberOfPages = self.imageArr.count;
    [self.contentView addSubview:_pageCtrl];
    
    [self addTimer];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return MAX_SECTIONS;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"id" forIndexPath:indexPath];
    cell.imageView.image = self.imageArr[indexPath.item];
    return cell;
}

#pragma mark - Timer
- (void)addTimer {
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (NSTimer *)timer {
    if(!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)nextPage {
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:MAX_SECTIONS/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathReset.item +1;
    NSInteger nextSection = currentIndexPathReset.section;
    if(nextItem == self.imageArr.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - configImages {
- (NSArray *)imageArr {
    if(!_imageArr) {
        _imageArr = @[[UIImage imageNamed:@"banner1"],[UIImage imageNamed:@"banner2"]];
    }
    return _imageArr;
}

#pragma mark - ScrollView 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.imageArr.count;
    self.pageCtrl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

@end
