//
//  AEFTableCollectionTests.m
//  AEFDataSource Tests
//
//  Created by Alex Fish on 14/05/2014.
//
//

#import <XCTest/XCTest.h>
#import "AEFTableCollection.h"
#import "AEFBaseCollection_Private.h"

@interface AEFTableCollectionTests : XCTestCase
@property (nonatomic, strong) AEFTableCollection *collection;
@end

@implementation AEFTableCollectionTests

- (void)setUp
{
    [super setUp];
    
    self.collection = [[AEFTableCollection alloc] initWithObjects:@[@1] cellIdentifier:@"Hello"];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testThatObjectsIsSet
{
    XCTAssertNotNil(self.collection.objects, @"Objects were not set");
}

- (void)testThatACellIdentifierIsSet
{
    XCTAssertNotNil(self.collection.cellIdentifier, @"Cell identifier was not set");
}

- (void)testThatCellIdentifierIsCopied
{
    AEFTableCollection *collection = [self.collection copy];
    XCTAssertNotNil(collection.cellIdentifier, @"Cell identifier was not copied");
}

@end
