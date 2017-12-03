//
//  CollectionViewCell.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/12/3.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "CollectionViewCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:_imageView];
    }
    return self;
}

@end
