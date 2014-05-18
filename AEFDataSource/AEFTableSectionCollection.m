//
//  AEFTableSectionCollection.m
//  
//
//  Created by Alex Fish on 18/05/2014.
//
//

#import "AEFTableSectionCollection.h"

// Frameworks
#include <objc/runtime.h>

// Class Extension
#import "AEFBaseCollection_Private.h"


@implementation AEFTableSectionCollection



#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects
{
    objects = @[objects];
    return [super initWithObjects:objects];;
}

- (instancetype)initWithObjects:(NSArray *)objects cellIdentifier:(NSString *)cellIdentifier
{
    objects = @[objects];
    return [super initWithObjects:objects cellIdentifier:cellIdentifier];
}


#pragma mark - Getters

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;

    return cellIdentifier;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    id object = nil;

    if ([[self.objects objectAtIndex:indexPath.row] isKindOfClass:[NSArray class]])
    {
        object = [[self objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    }
    else
    {
        object = [self objectAtIndex:indexPath.row];
    }

    return object;
}

@end
