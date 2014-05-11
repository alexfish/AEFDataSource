//
//  AEFTableViewDataSourceTests.m
//  AEFDataSource Tests
//
//  Created by Alex Fish on 11/05/2014.
//
//

#import <XCTest/XCTest.h>
#import "AEFTableViewDataSource.h"


@interface AEFTableViewDataSourceTests : XCTestCase
@property (nonatomic, strong) AEFTableViewDataSource *dataSource;
@property (nonatomic, copy) AEFTableViewCellConfigureBlock block;
@end


@implementation AEFTableViewDataSourceTests

- (void)setUp
{
    [super setUp];
    
    self.block = ^(id cell, id item, NSIndexPath *indexPath){};
    
    self.dataSource = [[AEFTableViewDataSource alloc] initWithItems:@[@1]
                                                     cellIdentifier:@""
                                                 configureCellBlock:self.block];
}


#pragma mark - Init

- (void)testThatItemsAreSet
{
    XCTAssertNotNil(self.dataSource.items, @"Items were not set");
}

- (void)testThatCellIdentifierIsSet
{
    XCTAssertNotNil(self.dataSource.cellIdentifier, @"Cell Identifier was not set");
}

- (void)testThatBlockIsSet
{
    XCTAssertNotNil(self.dataSource.configureCellBlock, @"Cell configuration block was not set");
}

- (void)testThatTheCorrectRowsAreReturned
{
    NSInteger count = [self.dataSource tableView:nil numberOfRowsInSection:0];
    XCTAssertEqual(@(count), @1, @"Incorrect row count returned");
}


#pragma mark - Mutation

- (void)testThatItemsAreAdded
{
    NSInteger count = self.dataSource.items.count;
    [self.dataSource addItems:@[@2]];
    XCTAssertEqual(@(self.dataSource.items.count), @(count + 1), @"Items were not added");
}

- (void)testThatItemsAreRemoved
{
    [self.dataSource addItems:@[@4]];
    NSInteger count = self.dataSource.items.count;
    [self.dataSource removeItems:@[@4]];
    
    XCTAssertEqual(@(self.dataSource.items.count), @(count - 1), @"Items were not removed");
}


#pragma mark - Configuration

- (void)testThatConfigureBlockIsCalled
{
    id tableView = [OCMockObject mockForClass:[UITableView class]];
    id cell = [OCMockObject mockForClass:[UITableViewCell class]];
    
    __block BOOL testBOOL = NO;
    
    AEFTableViewDataSource *dataSource = [[AEFTableViewDataSource alloc] initWithItems:@[@1] cellIdentifier:@"" configureCellBlock:^(id cell, id item, NSIndexPath *indexPath) {
       testBOOL = YES;
    }];
    
    [[[tableView stub] andReturn:cell] dequeueReusableCellWithIdentifier:[OCMArg any]forIndexPath:[OCMArg any]];
    
    [dataSource tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    XCTAssertTrue(testBOOL, @"Configure cell block was not called");
}

@end
