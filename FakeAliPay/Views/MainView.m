//
//  MainView.m
//  FakeAliPay
//
//  Created by Gary Lee on 2017/11/27.
//  Copyright © 2017年 UniqueStudio. All rights reserved.
//

#import "MainView.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WHITE_LILAC [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00]
#define NAVI_BLUE [UIColor colorWithRed:0.22 green:0.51 blue:0.80 alpha:1.00]


@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 145)];
        self.bigView.backgroundColor = NAVI_BLUE;
        self.smallView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 75)];
        self.smallView.backgroundColor = NAVI_BLUE;
//        _smallView.layer.opacity = 0.0f;
        
        self.btnView = [[ButtonView alloc] initWithFrame:CGRectMake(0, 125, frame.size.width, 210)];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-49)];//355
        self.tableView.contentInset = UIEdgeInsetsMake(315, 0, 0, 0);
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(315, 0, 0, 0);
        self.tableView.backgroundColor = WHITE_LILAC;
        [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        
        [self addSubview:_tableView];
        [self addSubview:_bigView];
        [self addSubview:_btnView];
        [self addSubview:_smallView];
        
        
        //将tableView的手势操作加到mainView中
        for (UIGestureRecognizer *gestureRecognizer in self.tableView.gestureRecognizers) {
            [self addGestureRecognizer:gestureRecognizer];
        }
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"contentOffset"] && object == self.tableView) {
        CGFloat y = [(NSValue *)change[@"new"] CGPointValue].y+335.0f;
        NSLog(@"%f", y);
        if(y >= 0) {
            CGRect newBtnViewFrame = CGRectMake(0, 125, SCREEN_WIDTH, 210);
            newBtnViewFrame.origin.y -= y;
            self.btnView.frame = newBtnViewFrame;
        } else {

        }
    }
}

@end
