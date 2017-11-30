//
//  Button.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/29.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "Button.h"

@implementation Button

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image andName:(NSString *)name {
    if(self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, frame.size.width, 15)];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = image;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.text = name;
        lable.font = [UIFont systemFontOfSize:14];
        [self addSubview:imageView];
        [self addSubview:lable];
    }
    return self;
}

@end
