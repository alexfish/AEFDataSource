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
    
    NSArray *items = @[@"Rows", @"Rows & Sections"];
    self.dataSource = [[AEFTableViewDataSource alloc] initWithItems:items cellIdentifier:@"Cell" configureCellBlock:^(UITableViewCell *cell, id item, NSIndexPath *indexPath) {
        cell.textLabel.text = item;
    }];
    
    self.tableView.dataSource = self.dataSource;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.text = @"AEFTableViewDataSource";
    
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *segue = nil;
    
    switch (indexPath.row) {
        case 0:
            segue = @"RowSegue";
            break;
        default:
            segue = @"SectionSegue";
            break;
    }
    
    [self performSegueWithIdentifier:segue sender:self];
}

@end
