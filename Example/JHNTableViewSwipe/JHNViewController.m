//
//  JHNViewController.m
//  JHNTableViewSwipe
//
//  Created by JHN on 06/03/2022.
//  Copyright (c) 2022 JHN. All rights reserved.
//

#import "JHNViewController.h"
#import "UITableView+JHNSwipe.h"
@interface JHNViewController ()

@end

@implementation JHNViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
