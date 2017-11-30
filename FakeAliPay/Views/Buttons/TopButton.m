//
//  TopButton.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/29.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "TopButton.h"

@implementation TopButton

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image andName:(NSString *)name {
    if(self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-35)];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeCenter;
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-50, frame.size.width, 35)];
        lable.text = name;
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:14];
        lable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:imageView];
        [self addSubview:lable];
    }
    return self;
}

@end
