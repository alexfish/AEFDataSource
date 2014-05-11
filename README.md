# AEFDataSource

Reusable data source models for your iOS application, inspired by the [lighter view controllers](http://www.objc.io/issue-1/lighter-view-controllers.html) movement. 

[![Build Status](https://travis-ci.org/alexfish/AEFDataSource.svg?branch=master)](https://travis-ci.org/alexfish/AEFDataSource)
[![Version](http://cocoapod-badges.herokuapp.com/v/AEFDataSource/badge.png)](http://cocoadocs.org/docsets/AEFDataSource)
[![Platform](http://cocoapod-badges.herokuapp.com/p/AEFDataSource/badge.png)](http://cocoadocs.org/docsets/AEFDataSource)

## Usage

To run the example project; clone the repo, and run `pod install` then open `AEFDataSource.xcworkspace`.

## Data sources

### AEFTableViewDataSource

A data source for a UITableView that supports an array of items or a multidimensional array of items for section support.

```
NSArray *items = @[@[@"Row", @"Row"], @[@"Row", @"Row"]];
self.dataSource = [[AEFTableViewDataSource alloc] initWithItems:items 
                                                 cellIdentifier:@"Cell" 
                                             configureCellBlock:^(UITableViewCell *cell, id item, NSIndexPath *indexPath) {
    cell.textLabel.text = [NSString stringWithFormat:@"%@_%i", item, indexPath.row];
}];
    
self.tableView.dataSource = self.dataSource;
```

See the example application for more in depth usage examples. 

## Installation

AEFDataSource is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "AEFDataSource"

## Author

Alex Fish, alex@alexefish.com

## License

AEFDataSource is available under the MIT license. See the LICENSE file for more info.

