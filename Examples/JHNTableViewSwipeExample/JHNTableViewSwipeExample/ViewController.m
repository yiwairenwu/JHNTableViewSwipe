//
//  ViewController.m
//  JHNTableViewSwipeExample
//
//  Created by 金海南 on 2022/6/2.
//

#import "ViewController.h"
#import "UITableView+JHNSwipe.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView addSectionCanSwipe:^BOOL(NSInteger number) {
        if (number==0) {
            return NO;
        }else{
            return YES;
        }
    }];
    [self.tableView addSectionSwipeDelete:^(NSInteger number) {
        NSLog(@"删除了%ld",number);
    }];
    // Do any additional setup after loading the view.
}


@end
