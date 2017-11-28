//
//  ViewController.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/24.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIRefreshControl *refresh;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarItem.title = @"首页";
    self.tabBarItem.image = [UIImage imageNamed:@"首页"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"selected首页"];
    
    MainView *mainView = [[MainView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:mainView];
    mainView.tableView.delegate = self;
    mainView.tableView.dataSource = self;
    
    self.refresh = [[UIRefreshControl alloc] init];
    [self.refresh addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    mainView.tableView.refreshControl = _refresh;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *id = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", (long)indexPath.row];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (void)refreshAction {
    [self.refresh endRefreshing];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    
}
@end
