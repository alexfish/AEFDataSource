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
@property (nonatomic, strong) NSIndexPath *defaultIndexPath;
@end

@implementation AEFTableSectionCollectionTests

- (void)setUp
{
    [super setUp];

    self.defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
}


#pragma mark - Init

- (void)testThatObjectsAreSet
{
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@1]];
    XCTAssertNotNil([self.collection objectAtIndexPath:self.defaultIndexPath], @"Objects was not set");
}

- (void)testThatObjectsAreSetWithACellIdentifier
{
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@1] cellIdentifier:@"Cell"];
    XCTAssertNotNil([self.collection objectAtIndexPath:self.defaultIndexPath], @"Objects was not set");
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

    XCTAssertNotNil([self.collection objectAtIndexPath:self.defaultIndexPath], @"Objects were not returned in a section");
}

- (void)testThatCellIdentifierIsReturnedForADefaultSection
{
    NSString *cellIdentifier = @"Hello";
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[@1] cellIdentifier:cellIdentifier];

    XCTAssertEqual(cellIdentifier, [self.collection cellIdentifierAtIndexPath:self.defaultIndexPath], @"Wrong cell identifier returned");
}


#pragma mark - Mutation

- (void)testThatObjectsAreAddedToSection
{
    NSString *cellIdentifier = @"Hello";
    self.collection = [[AEFTableSectionCollection alloc] initWithObjects:@[] cellIdentifier:cellIdentifier];

    NSArray *objects = @[@100];
    [self.collection addObjects:objects toSection:0 withCellIdentifier:cellIdentifier];

    XCTAssertEqual(self.collection[0][0], objects[0], @"Objects were not added to section");
}

@end
