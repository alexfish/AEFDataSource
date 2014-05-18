//
//  AEFTableSectionCollection.m
//  
//
//  Created by Alex Fish on 18/05/2014.
//
//

#import "AEFTableSectionCollection.h"

// Class Extension
#import "AEFBaseCollection_Private.h"

// Categories
#import "NSObject+AEFCellIdentifier.h"


@implementation AEFTableSectionCollection



#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects
{
    self = [super initWithObjects:@[objects]];
    if (self)
    {
        [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [obj setAssociatedCellIdentifer:AEFDefaultCellIdentifier];
        }];
    }

    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects cellIdentifier:(NSString *)cellIdentifier
{
    self = [super initWithObjects:@[objects] cellIdentifier:cellIdentifier];
    if (self)
    {
        [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [obj setAssociatedCellIdentifer:cellIdentifier];
        }];
    }

    return self;
}


#pragma mark - Getters

- (NSString *)cellIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;

    id object = [self objectAtIndexPath:indexPath];
    if (object)
    {
        cellIdentifier = [object associatedCellIdentifer];
    }

    return cellIdentifier;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
}

@end
