//
//  ButtonView.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/26.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "ButtonView.h"
#import "Button.h"

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        NSArray *nameArr = @[@"转账", @"充值中心", @"余额宝", @"记账本", @"花呗", @"我的快递", @"芝麻信用", @"共享单车", @"蚂蚁森林", @"蚂蚁庄园", @"我的客服", @"更多"];
        self.backgroundColor = [UIColor whiteColor];
        for(int index = 0; index < 12; index++) {
            int row = index/4;
            int col = index%4;
            NSString *imageName = [NSString stringWithFormat:@"row%dcol%d", row, col];
            Button *btn = [[Button alloc] initWithFrame:CGRectMake(col*frame.size.width/4, row*70, frame.size.width/4, 70) image:[UIImage imageNamed:imageName] andName:nameArr[index]];
            [self addSubview:btn];
        }
    }
    return self;
}

@end
