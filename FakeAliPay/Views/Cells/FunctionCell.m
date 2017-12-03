//
//  FunctionCell.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "FunctionCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@implementation FunctionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //frame
        UIImageView *tag = [[UIImageView alloc] initWithFrame:CGRectMake(12, 14, 6, 12)];
        tag.image = [UIImage imageNamed:@"tag"];
        tag.contentMode = UIViewContentModeLeft;
        [self.contentView addSubview:tag];
        
        UIView *horizontal = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 1)];
        horizontal.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
        [self.contentView addSubview:horizontal];
        
        UIView *vertical = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 40, 1, 90)];
        vertical.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
        [self.contentView addSubview:vertical];
        
        //content
        self.func = [[UILabel alloc] initWithFrame:CGRectMake(24, 13, 80, 14)];
        self.func.textColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.00];
        self.func.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.func];
        
        self.title1 = [[UILabel alloc] initWithFrame:CGRectMake(12, 70, 110, 15)];
        self.title1.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.title1];
        
        self.subtitle1 = [[UILabel alloc] initWithFrame:CGRectMake(12, 93, 110, 12)];
        self.subtitle1.font = [UIFont systemFontOfSize:12];
        self.subtitle1.textColor = [UIColor colorWithRed:0.56 green:0.56 blue:0.56 alpha:1.00];
        [self.contentView addSubview:self.subtitle1];
        
        self.image1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-60, 60, 48, 48)];
        self.image1.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:self.image1];
        
        self.title2 = [[UILabel alloc] initWithFrame:CGRectMake(12+SCREEN_WIDTH/2, 70, 110, 15)];
        self.title2.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.title2];
        
        self.subtitle2 = [[UILabel alloc] initWithFrame:CGRectMake(12+SCREEN_WIDTH/2, 93, 110, 12)];
        self.subtitle2.font = [UIFont systemFontOfSize:12];
        self.subtitle2.textColor = [UIColor colorWithRed:0.56 green:0.56 blue:0.56 alpha:1.00];
        [self.contentView addSubview:self.subtitle2];
        
        self.image2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 60, 48, 48)];
        self.image2.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:self.image2];
    }
    return self;
}

- (void)configDataWithDict:(NSDictionary *)dict {
    self.func.text = dict[@"name"];
    self.title1.text = dict[@"title1"];
    self.subtitle1.text = dict[@"subtitle1"];
    self.image1.image = dict[@"image1"];
    self.title2.text = dict[@"title2"];
    self.subtitle2.text = dict[@"subtitle2"];
    self.image2.image = dict[@"image2"];
}

@end
