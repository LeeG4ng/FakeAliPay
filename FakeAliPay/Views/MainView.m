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
#define WHITE_SMOKE [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00]
#define NAVI_BLUE [UIColor colorWithRed:0.22 green:0.51 blue:0.80 alpha:1.00]


@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.bigView = [[BigView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 145)];
        self.bigView.backgroundColor = NAVI_BLUE;
        self.smallView = [[SmallView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 75)];
        self.smallView.backgroundColor = NAVI_BLUE;
        
        self.btnView = [[ButtonView alloc] initWithFrame:CGRectMake(0, 145, frame.size.width, 210)];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-49)];//355
        self.tableView.contentInset = UIEdgeInsetsMake(335, 0, 0, 0);
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(335, 0, 0, 0);
        self.tableView.backgroundColor = WHITE_SMOKE;
        [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        
        [self addSubview:_tableView];
        [self addSubview:_bigView];
        [self addSubview:_btnView];
        [self addSubview:_smallView];
        
        
//        将tableView的手势操作加到mainView中
        for (UIGestureRecognizer *gestureRecognizer in self.tableView.gestureRecognizers) {
            if([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
                [self addGestureRecognizer:gestureRecognizer];
            }
        }
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"contentOffset"] && object == self.tableView) {
        CGFloat y = [(NSValue *)change[@"new"] CGPointValue].y+355.0f;
        NSLog(@"y = %f", y);
        if(y >= 0) {
            if(y <= 70 && y > 0) {
                self.rate = y/70;
                NSLog(@"rate = %f", self.rate);
                
            } else if(y > 70) {
                self.rate = 1;
                
            } else {
                self.rate = 0;
            }
            CGRect newBtnViewFrame = CGRectMake(0, 145, SCREEN_WIDTH, 210);
            newBtnViewFrame.origin.y -= y;
            self.btnView.frame = newBtnViewFrame;
            
            CGRect newBigViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, 145);
            newBigViewFrame.origin.y -= y/2;
            self.bigView.frame = newBigViewFrame;
            if(self.rate < 0.6) {
                for(int i = 0; i < 4; i++) {
                    UIButton *bBtn = [self.bigView viewWithTag:100+i];
                    bBtn.alpha = 1-self.rate/0.6f;
                    self.bigView.backgroundColor = NAVI_BLUE;
                }
            }
            if(self.rate > 0.4) {
                self.smallView.alpha = (self.rate-0.4)/0.6f;
            } else {
                self.smallView.alpha = 0;
            }
            if(self.rate < 0.3) {
                self.bigView.search.alpha = (0.3-self.rate)/0.3f;
                self.bigView.contacts.alpha = (0.3-self.rate)/0.3f;
                self.bigView.more.alpha = (0.3-self.rate)/0.3f;
                self.bigView.mic.alpha = (0.3-self.rate)/0.3f;
            } else {
                self.bigView.search.alpha = 0;
                self.bigView.contacts.alpha = 0;
                self.bigView.more.alpha = 0;
                self.bigView.mic.alpha = 0;
            }
        } else {
            CGRect newBtnViewFrame = CGRectMake(0, 145, SCREEN_WIDTH, 210);
            self.btnView.frame = newBtnViewFrame;
            
            CGRect newBigViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, 145);
            self.bigView.frame = newBigViewFrame;
            
            self.smallView.alpha = 0;
            for(int i = 0; i < 4; i++) {
                UIButton *bBtn = [self.bigView viewWithTag:100+i];
                bBtn.alpha = 1;
            }
            self.bigView.search.alpha = 1;
            self.bigView.contacts.alpha = 1;
            self.bigView.more.alpha = 1;
            self.bigView.mic.alpha = 1;
        }
    }
}

@end
