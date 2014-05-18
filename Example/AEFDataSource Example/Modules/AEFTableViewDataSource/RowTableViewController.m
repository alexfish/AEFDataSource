//
//  RowTableViewController.m
//  AEFDataSource Example
//
//  Created by Alex Fish on 11/05/2014.
//  Copyright (c) 2014 alexefish. All rights reserved.
//

#import "RowTableViewController.h"

// DataSource
#import "AEFTableViewDataSource.h"
#import "AEFTableCollection.h"


@interface RowTableViewController ()
@property (nonatomic, strong) AEFTableViewDataSource *dataSource;
@end


@implementation RowTableViewController


#pragma mark - Init

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupTableView];
}


#pragma mark - Setup

- (void)setupTableView
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    AEFTableCollection *collection = [[AEFTableCollection alloc] initWithObjects:@[@"Row", @"Row", @"Row"]
                                                                  cellIdentifier:@"Cell"];

    self.dataSource = [[AEFTableViewDataSource alloc] initWithCollection:collection configureCellBlock:^(UITableViewCell *cell, id item, NSIndexPath *indexPath) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@_%i", item, indexPath.row];
    }];
    
    self.tableView.dataSource = self.dataSource;
}

@end
