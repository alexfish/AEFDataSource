//
//  AEFTableViewDataSourceTests.m
//  AEFDataSource Tests
//
//  Created by Alex Fish on 11/05/2014.
//
//

#import <XCTest/XCTest.h>
#import "AEFTableViewDataSource.h"
#import "AEFTableCollection.h"
#import "AEFTableSectionCollection.h"


@interface AEFTableViewDataSourceTests : XCTestCase
@property (nonatomic, strong) AEFTableViewDataSource *dataSource;
@property (nonatomic, copy) AEFTableViewCellConfigureBlock block;
@end


@implementation AEFTableViewDataSourceTests


#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    self.block = ^(id cell, id item, NSIndexPath *indexPath){};
    self.dataSource = [[AEFTableViewDataSource alloc] initWithCollection:self.collection configureCellBlock:^(UITableViewCell *cell, id item, NSIndexPath *indexPath) {}];
}

- (AEFTableCollection *)collection
{
    return [[AEFTableCollection alloc] initWithObjects:@[@2]];
}

- (AEFTableSectionCollection *)sectionCollection
{
    return [[AEFTableSectionCollection alloc] initWithObjects:@[@2]];
}


#pragma mark - Init

- (void)testThatCollectionIsSet
{
    XCTAssertNotNil(self.dataSource.collection, @"Items were not set");
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


#pragma mark - Configuration

- (void)testThatConfigureBlockIsCalled
{
    id tableView = [OCMockObject mockForClass:[UITableView class]];
    id cell = [OCMockObject mockForClass:[UITableViewCell class]];
    
    __block BOOL testBOOL = NO;
    
    AEFTableViewDataSource *dataSource = [[AEFTableViewDataSource alloc] initWithCollection:self.collection configureCellBlock:^(id cell, id item, NSIndexPath *indexPath) {
       testBOOL = YES;
    }];
    
    [[[tableView stub] andReturn:cell] dequeueReusableCellWithIdentifier:[OCMArg any]forIndexPath:[OCMArg any]];
    
    [dataSource tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    XCTAssertTrue(testBOOL, @"Configure cell block was not called");
}

- (void)testThatConfigureBlockIsCalledForSections
{
    id tableView = [OCMockObject mockForClass:[UITableView class]];
    id cell = [OCMockObject mockForClass:[UITableViewCell class]];
    
    __block BOOL testBOOL = NO;
    
    AEFTableViewDataSource *dataSource = [[AEFTableViewDataSource alloc] initWithCollection:self.sectionCollection configureCellBlock:^(id cell, id item, NSIndexPath *indexPath) {
        testBOOL = YES;
    }];
    
    [[[tableView stub] andReturn:cell] dequeueReusableCellWithIdentifier:[OCMArg any]forIndexPath:[OCMArg any]];
    
    [dataSource tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    XCTAssertTrue(testBOOL, @"Configure cell block was not called");
}

- (void)testThatConfigureBlockIsNotCalledForInvalidSections
{
    id tableView = [OCMockObject mockForClass:[UITableView class]];
    id cell = [OCMockObject mockForClass:[UITableViewCell class]];
    
    __block BOOL testBOOL = NO;
    
    AEFTableViewDataSource *dataSource = [[AEFTableViewDataSource alloc] initWithCollection:self.sectionCollection configureCellBlock:^(id cell, id item, NSIndexPath *indexPath) {
        testBOOL = YES;
    }];
    
    [[[tableView stub] andReturn:cell] dequeueReusableCellWithIdentifier:[OCMArg any]forIndexPath:[OCMArg any]];
    
    [dataSource tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:20]];
    
    XCTAssertFalse(testBOOL, @"Configure cell block was called");
}

@end
