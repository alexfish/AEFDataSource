//
//  MenuTableViewController.m
//  AEFDataSource Example
//
//  Created by Alex Fish on 11/05/2014.
//  Copyright (c) 2014 alexefish. All rights reserved.
//

#import "MenuTableViewController.h"

// DataSource
#import "AEFTableViewDataSource.h"

@interface MenuTableViewController ()
@property (nonatomic, strong) AEFTableViewDataSource *dataSource;
@end

@implementation MenuTableViewController


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
    
    NSArray *items = @[@[@"Row", @"Row"], @[@"Row", @"Row"], @[@"Row", @"Row"]];
    self.dataSource = [[AEFTableViewDataSource alloc] initWithItems:items cellIdentifier:@"Cell" configureCellBlock:^(UITableViewCell *cell, id item, NSIndexPath *indexPath) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@-%i", item, indexPath.row];
    }];
    
    self.tableView.dataSource = self.dataSource;
}


#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"Section-%i", section];
    
    return label;
}

@end
