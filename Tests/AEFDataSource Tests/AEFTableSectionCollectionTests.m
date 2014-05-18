//
//  AEFTableSectionCollectionTests.m
//  AEFDataSource Tests
//
//  Created by Alex Fish on 18/05/2014.
//
//

#import <XCTest/XCTest.h>
#import "AEFTableSectionCollection.h"

@interface AEFTableSectionCollectionTests : XCTestCase
@property (nonatomic, strong) AEFTableSectionCollection *collection;
@end

@implementation AEFTableSectionCollectionTests

- (void)setUp
{
    [super setUp];
}


#pragma mark - Init

- (void)testThatObjectsAreSet
{
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@1]];
    XCTAssertNotNil([self.collection objectAtIndex:0 inSection:0], @"Objects was not set");
}

- (void)testThatObjectsAreSetWithACellIdentifier
{
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@1] cellIdentifier:@"Cell"];
    XCTAssertNotNil([self.collection objectAtIndex:0 inSection:0], @"Objects was not set");
}

- (void)testThatCellIdentiferIsSet
{
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@1] cellIdentifier:@"Cell"];
    XCTAssertNotNil(self.collection.cellIdentifier, @"Cell identifier was not set");
}


#pragma mark - Getters

- (void)testThatObjectsAreReturnedInADefaultSection
{
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@2]];

    XCTAssertNotNil([self.collection objectAtIndex:0 inSection:0], @"Objects were not returned in a section");
}

@end
