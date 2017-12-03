//
//  NotificationCell.h
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell

@property (nonatomic, strong) UILabel *msg1;
@property (nonatomic, strong) UILabel *msg2;

- (void)configDataWithArr:(NSArray *)arr;

@end
