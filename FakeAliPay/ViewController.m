//
//  ViewController.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/24.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "NotificationCell.h"
#import "BannerCell.h"
#import "FunctionCell.h"
#import "FooterCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define WHITE_SMOKE [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00]
#define WHITE_LILAC [UIColor colorWithRed:0.92 green:0.91 blue:0.91 alpha:1.00]

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIRefreshControl *refresh;
@property (nonatomic, strong) MainView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarItem.title = @"首页";
    self.tabBarItem.image = [UIImage imageNamed:@"首页"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"selected首页"];
    
    self.mainView = [[MainView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:self.mainView];
    self.mainView.tableView.delegate = self;
    self.mainView.tableView.dataSource = self;
    
    self.refresh = [[UIRefreshControl alloc] init];
    [self.refresh addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    self.mainView.tableView.refreshControl = _refresh;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configure Cell
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        static NSString *notificationCellID = @"notificationCell";
        NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:notificationCellID];
        if(!cell) {
            cell = [[NotificationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:notificationCellID];
        }
        
        return cell;
    } else if(indexPath.section == 1) {
        static NSString *bannerCellID = @"bannerCell";
        BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:bannerCellID];
        if(!cell) {
            cell = [[BannerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:bannerCellID];
        }
        
        return cell;
    } else {
        if(indexPath.row == 1) {
            static NSString *footerCellID = @"footerCell";
            FooterCell *cell = [tableView dequeueReusableCellWithIdentifier:footerCellID];
            if(!cell) {
                cell = [[FooterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:footerCellID];
            }
            return cell;
        }
        static NSString *functionCellID = @"functionCell";
        FunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:functionCellID];
        if(!cell) {
            cell = [[FunctionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:functionCellID];
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 68;
    } else if(indexPath.section == 1) {
        return 90;
    } else {
        if(indexPath.row == 1)
            return 74;
        return 130;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 3)
        return 2;
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

#pragma mark - Configure Scroll
- (void)refreshAction {
    [self.refresh endRefreshing];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(self.mainView.tableView.contentOffset.y < 70-355) {
    if(self.mainView.rate < 0.5) {
        [self.mainView.tableView setContentOffset:CGPointMake(0, -355) animated:YES];
    } else {
        [self.mainView.tableView setContentOffset:CGPointMake(0, 70-355) animated:YES];
    }
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
