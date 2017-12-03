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
@property (nonatomic, strong) NSArray *funcArr;
@property (nonatomic, strong) NSArray *msgArr;

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
        NSMutableArray *imageArr = [NSMutableArray array];
        for(int i = 1; i <= 24; i++) {
            NSString *str = [NSString stringWithFormat:@"gif%d", i];
            [imageArr addObject:[UIImage imageNamed:str]];
        }
        cell.image.animationImages = imageArr;
        cell.image.animationDuration = 2.4f;
        [cell.image startAnimating];
        [cell configDataWithArr:self.msgArr];
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
        NSInteger index = indexPath.section;
        index = (index - 2)%2;
        [cell configDataWithDict:self.funcArr[index]];
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(self.mainView.tableView.contentOffset.y > -355) {
        NSLog(@"=======%lf",self.mainView.tableView.contentOffset.y);
        if(self.mainView.tableView.contentOffset.y < 70-355) {
            if(self.mainView.rate < 0.5) {
                [self.mainView.tableView setContentOffset:CGPointMake(0, -355) animated:YES];
            } else {
                [self.mainView.tableView setContentOffset:CGPointMake(0, 70-355) animated:YES];
            }
        }
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Configure Data
- (NSArray *)msgArr {
    if(!_msgArr) {
        NSAttributedString *detail1 = [[NSAttributedString alloc] initWithString:@"蚂蚁庄园提醒你又有小鸡来抢食" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Light" size:14]}];
        NSAttributedString *time1 = [[NSAttributedString alloc] initWithString:@"  6分钟前" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor colorWithRed:0.64 green:0.64 blue:0.64 alpha:1.00]}];
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithAttributedString:detail1];
        [str1 appendAttributedString:time1];
        
        NSAttributedString *detail2 = [[NSAttributedString alloc] initWithString:@"付款后你还得到了这些" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Light" size:14]}];
        NSAttributedString *time2 = [[NSAttributedString alloc] initWithString:@"  30分钟前" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor colorWithRed:0.64 green:0.64 blue:0.64 alpha:1.00]}];
        NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithAttributedString:detail2];
        [str2 appendAttributedString:time2];
        _msgArr = @[str1, str2];
    }
    return _msgArr;
}

- (NSArray *)funcArr {
    if(!_funcArr) {
        NSDictionary *func0 = @{@"name":@"惠支付", @"title1":@"提现免服务费", @"subtitle1":@"蚂蚁积分兑好礼", @"image1":[UIImage imageNamed:@"func0.1"], @"title2":@"支付宝发红包", @"subtitle2":@"通知好友来领取", @"image2":[UIImage imageNamed:@"func0.2"]};
        NSDictionary *func1 = @{@"name":@"生活服务", @"title1":@"证件照随手拍", @"subtitle1":@"快来试试吧！", @"image1":[UIImage imageNamed:@"func1.1"], @"title2":@"这些统统免费", @"subtitle2":@"2017福利你知多少", @"image2":[UIImage imageNamed:@"func1.2"]};
        _funcArr = @[func0, func1];
    }
    return _funcArr;
}
@end
