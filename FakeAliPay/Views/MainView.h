//
//  MainView.h
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/27.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "BigView.h"
#import "SmallView.h"

@interface MainView : UIView

@property (nonatomic, strong) BigView *bigView;
@property (nonatomic, strong) SmallView *smallView;
@property (nonatomic, strong) ButtonView *btnView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) double rate;

@end
