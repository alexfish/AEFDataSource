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

- (id)initWithObjects:(NSArray *)objects
{
    objects = @[objects];
    return [super initWithObjects:objects];;
}

- (id)initWithObjects:(NSArray *)objects cellIdentifier:(NSString *)cellIdentifier
{
    objects = @[objects];
    return [super initWithObjects:objects cellIdentifier:cellIdentifier];
}


#pragma mark - Getters

- (id)objectAtIndex:(NSUInteger)index inSection:(NSUInteger)section
{
    id object = nil;

    if ([[self.objects objectAtIndex:index] isKindOfClass:[NSArray class]])
    {
        object = [[self objectAtIndex:index] objectAtIndex:section];
    }
    else
    {
        object = [self objectAtIndex:index];
    }

    return object;
}

@end
