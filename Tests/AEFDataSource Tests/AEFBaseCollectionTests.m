//
//  AEFBaseCollectionTests.m
//  AEFDataSource Tests
//
//  Created by Alex Fish on 13/05/2014.
//
//

#import <XCTest/XCTest.h>
#import "AEFBaseCollection.h"
#import "AEFBaseCollection_Private.h"


@interface AEFBaseCollectionTests : XCTestCase
@property (nonatomic, strong) AEFBaseCollection *collection;
@end

@implementation AEFBaseCollectionTests

- (void)setUp
{
    [super setUp];
    
    self.collection = [[AEFBaseCollection alloc] initWithObjects:@[@1]];
}


#pragma mark - Init

- (void)testThatObjectsAreSet
{
    XCTAssertNotNil(self.collection.objects, @"Objects were not set");
}


#pragma mark - Mutation

- (void)testThatAnObjectIsAdded
{
    NSInteger count = self.collection.count;
    [self.collection addObject:@2];
    
    XCTAssertEqual(@(self.collection.count), @(count + 1), @"Objects were not added");
}

- (void)testThatAnObjectIsRemoved
{
    [self.collection addObject:@2];
    NSInteger count = self.collection.count;
    [self.collection removeObject:@2];
    
    XCTAssertEqual(@(self.collection.objects.count), @(count - 1), @"Objects were not added");
}

- (void)testThatObjectsAreAdded
{
    NSInteger count = self.collection.count;
    [self.collection addObjects:@[@2]];
    
    XCTAssertEqual(@(self.collection.count), @(count + 1), @"Objects were not added");
}

- (void)testThatObjectsAreRemoved
{
    [self.collection addObject:@2];
    NSInteger count = self.collection.count;
    [self.collection removeObjects:@[@2]];
    
    XCTAssertEqual(@(self.collection.objects.count), @(count - 1), @"Objects were not added");
}

@end
