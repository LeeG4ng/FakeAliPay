//
//  BigView.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/28.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "BigView.h"
#import "TopButton.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define DENIM [UIColor colorWithRed:0.20 green:0.45 blue:0.71 alpha:1.00]

@implementation BigView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        for(int i = 0;i <= 3 ; i++) {
            NSString *imageName = [NSString stringWithFormat:@"B%d", i];
            NSArray *btnName = @[@"扫一扫", @"付钱", @"收钱", @"卡包"];
            TopButton *bBtn = [[TopButton alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH/4, 64, SCREEN_WIDTH/4, SCREEN_WIDTH/4) image:[UIImage imageNamed:imageName] andName:btnName[i]];
            bBtn.backgroundColor = [UIColor clearColor];
            bBtn.tag = 100+i;
            [self addSubview:bBtn];
        }
        
        self.search = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 28, 265, 28)];
        [self addSubview:self.search];
        self.search.backgroundImage = [[UIImage alloc] init];
        UITextField *searchField = [self.search valueForKey:@"searchField"];
        searchField.backgroundColor = DENIM;
        searchField.layer.cornerRadius = 1.0f;
        searchField.layer.masksToBounds = YES;
        searchField.textColor = [UIColor whiteColor];
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:@"花呗" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        searchField.attributedPlaceholder = placeholder;
        [self.search setImage:[UIImage imageNamed:@"S3"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        
        self.contacts = [UIButton buttonWithType:UIButtonTypeCustom];
        self.contacts.frame = CGRectMake(300, 30, 22, 22);
        [self.contacts setImage:[UIImage imageNamed:@"Bcontacts"] forState:UIControlStateNormal];
        self.more = [UIButton buttonWithType:UIButtonTypeCustom];
        self.more.frame = CGRectMake(342, 30, 22, 22);
        [self.more setImage:[UIImage imageNamed:@"Badd"] forState:UIControlStateNormal];
        self.mic = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mic.frame = CGRectMake(252, 34, 16, 16);
        [self.mic setImage:[UIImage imageNamed:@"Bmic"] forState:UIControlStateNormal];
        [self addSubview:self.contacts];
        [self addSubview:self.more];
        [self addSubview:self.mic];
    }
    return self;
}

@end
