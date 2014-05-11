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

@end

@implementation AEFTableViewDataSourceTests

- (void)testThatAEFTableViewDataSourceCanInit
{
    AEFTableViewDataSource *dataSource = [[AEFTableViewDataSource alloc] init];
    XCTAssertNotNil(dataSource, @"datasource did not init");
}

@end
