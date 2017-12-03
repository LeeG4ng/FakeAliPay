//
//  NotificationCell.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "NotificationCell.h"

@implementation NotificationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 4, 88, 68)];
        NSMutableArray *imageArr = [NSMutableArray array];
        for(int i = 1; i <= 24; i++) {
            NSString *str = [NSString stringWithFormat:@"gif%d", i];
            [imageArr addObject:[UIImage imageNamed:str]];
        }
        image.animationImages = imageArr;
        image.animationDuration = 2.4f;
        image.contentMode = UIViewContentModeLeft;
        image.layer.masksToBounds = YES;
        [image startAnimating];
        [self.contentView addSubview:image];
        
        self.msg1 = [[UILabel alloc] initWithFrame:CGRectMake(93, 18, 260, 14)];
        self.msg1.textAlignment = NSTextAlignmentLeft;
        self.msg2 = [[UILabel alloc] initWithFrame:CGRectMake(93, 38, 260, 14)];
        self.msg2.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.msg1];
        [self.contentView addSubview:self.msg2];
    }
    return self;
}

- (void)configDataWithArr:(NSArray *)arr {
    self.msg1.attributedText = arr[0];
    self.msg2.attributedText = arr[1];
}

@end
