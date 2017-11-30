//
//  FooterCell.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "FooterCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define WHITE_SMOKE [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00]
#define WHITE_LILAC [UIColor colorWithRed:0.92 green:0.91 blue:0.91 alpha:1.00]

@implementation FooterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 74)];
        footerView.backgroundColor = [UIColor clearColor];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, 37, SCREEN_WIDTH-30, 1)];
        line.backgroundColor = WHITE_LILAC;
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-61, 30, 122, 14)];
        lable.backgroundColor = WHITE_SMOKE;
        lable.text = @"我是有底线的";
        lable.font = [UIFont systemFontOfSize:14];
        lable.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.60 alpha:1.00];
        lable.textAlignment = NSTextAlignmentCenter;
        [footerView addSubview:line];
        [footerView addSubview:lable];
        [self.contentView addSubview:footerView];
    }
    return self;
}

@end
