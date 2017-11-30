//
//  SmallView.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/28.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "SmallView.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@implementation SmallView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        for(int i = 0;i <= 4 ; i++) {
            UIImageView *sBtn = [[UIImageView alloc] init];
            if(i == 4) {
                sBtn.frame = CGRectMake(SCREEN_WIDTH-60, 20, 60, 60);
            } else {
                sBtn.frame = CGRectMake(i*60, 20, 60, 60);
            }
            sBtn.backgroundColor = [UIColor clearColor];
            NSString *imageName = [NSString stringWithFormat:@"S%d", i];
            sBtn.image = [UIImage imageNamed:imageName];
            sBtn.contentMode = UIViewContentModeCenter;
            [self addSubview:sBtn];
        }
    }
    return self;
}

@end
