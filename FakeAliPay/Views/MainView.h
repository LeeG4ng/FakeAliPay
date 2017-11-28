//
//  MainView.h
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/27.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"

@interface MainView : UIView

@property (nonatomic, strong) UIView *bigView;
@property (nonatomic, strong) UIView *smallView;
@property (nonatomic, strong) ButtonView *btnView;
@property (nonatomic, strong) UITableView *tableView;

@end
