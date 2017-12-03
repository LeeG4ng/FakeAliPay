//
//  FunctionCell.h
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/30.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionCell : UITableViewCell

@property (nonatomic, strong) UILabel *func;
@property (nonatomic, strong) UILabel *title1;
@property (nonatomic, strong) UILabel *subtitle1;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UILabel *title2;
@property (nonatomic, strong) UILabel *subtitle2;
@property (nonatomic, strong) UIImageView *image2;

- (void)configDataWithDict:(NSDictionary *)dict;

@end
