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
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 4, 88, 68)];
        [self.contentView addSubview:_image];
        _image.contentMode = UIViewContentModeLeft;
        _image.layer.masksToBounds = YES;
        
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
