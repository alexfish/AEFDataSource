//
//  AEFTableCollection.m
//  
//
//  Created by Alex Fish on 14/05/2014.
//
//

#import "AEFTableCollection.h"

// Categories
#import "NSObject+AEFCellIdentifier.h"

// Class Extensions
#import "AEFBaseCollection_Private.h"
#import "AEFTableCollection_Private.h"


/**
 *  Constants
 */
NSString * const AEFDefaultCellIdentifier = @"AEFDefaultCellIdentifier";


@implementation AEFTableCollection


#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects
{
    self = [super initWithObjects:objects];
    if (self)
    {
        _cellIdentifier = AEFDefaultCellIdentifier;
        [self AEF_associateCellIdentifier:self.cellIdentifier toObjects:self.objects];
    }

    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects
                 cellIdentifier:(NSString *)cellIdentifier
{
    self = [super initWithObjects:objects];
    if (self)
    {
        _cellIdentifier = [cellIdentifier copy];
        [self AEF_associateCellIdentifier:self.cellIdentifier toObjects:self.objects];
    }
    
    return self;
}


#pragma mark - Cell Identifier (Private)

- (void)AEF_associateCellIdentifier:(NSString *)cellIdentifier toObjects:(NSArray *)objects
{
    [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setAssociatedCellIdentifer:cellIdentifier];
    }];
}


#pragma mark - Getters

- (NSString *)cellIdentifierAtIndex:(NSUInteger)index
{
    NSString *cellIdentifier = nil;

    id object = [self objectAtIndex:index];
    if (object)
    {
        cellIdentifier = [object associatedCellIdentifer];
    }

    return cellIdentifier;
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AEFTableCollection *collection = [super copyWithZone:zone];
    collection.cellIdentifier = [self.cellIdentifier copy];
    
    return collection;
}

@end
