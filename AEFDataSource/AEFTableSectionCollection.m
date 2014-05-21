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
#import "AEFTableCollection_Private.h"

// Categories
#import "NSObject+AEFCellIdentifier.h"


@implementation AEFTableSectionCollection


#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects
{
    return [super initWithObjects:@[objects]];;
}

- (instancetype)initWithObjects:(NSArray *)objects
                 cellIdentifier:(NSString *)cellIdentifier
{
    return [super initWithObjects:@[objects] cellIdentifier:cellIdentifier];;
}


#pragma mark - Cell Identifier (Private)

- (void)AEF_associateCellIdentifier:(NSString *)cellIdentifier toObjects:(NSArray *)objects
{
    [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]])
        {
            NSArray *sectionObjects = (NSArray *)obj;
            [sectionObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [obj setAssociatedCellIdentifer:cellIdentifier];
            }];
        }
        else
        {
            [obj setAssociatedCellIdentifer:cellIdentifier];
        }
    }];
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


#pragma mark - Mutation

- (void)addObjects:(NSArray *)objects toSection:(NSUInteger)section withCellIdentifier:(NSString *)cellIdentifier
{
    [self AEF_associateCellIdentifier:cellIdentifier toObjects:objects];

    NSArray *sectionObjects         = [self AEF_objectsAtSection:section];
    NSArray *updatedSectionObjects  = [self AEF_arrayByAddingObjects:objects toArray:sectionObjects];

    NSMutableArray *mutableObjects  = [NSMutableArray arrayWithArray:self.objects];

    if (section < mutableObjects.count)
    {
        [mutableObjects replaceObjectAtIndex:section withObject:updatedSectionObjects];
    }
    else
    {
        [mutableObjects addObject:updatedSectionObjects];
    }

    self.objects = [NSArray arrayWithArray:mutableObjects];
}

- (void)removeObjects:(NSArray *)objects fromSection:(NSUInteger)section
{
    if (section >= self.objects.count) return;

    NSArray *sectionObjects         = [self.objects objectAtIndex:section];
    NSArray *updatedSectionObjects  = [self AEF_arrayByRemovingObjects:objects fromArray:sectionObjects];

    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:self.objects];
    [mutableObjects replaceObjectAtIndex:section withObject:updatedSectionObjects];

    self.objects = [NSArray arrayWithArray:mutableObjects];
}


#pragma mark - Mutation (Private)

- (NSArray *)AEF_arrayByRemovingObjects:(NSArray *)objects fromArray:(NSArray *)array
{
    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:array];
    [mutableObjects removeObjectsInArray:objects];
    return [NSArray arrayWithArray:mutableObjects];
}

- (NSArray *)AEF_arrayByAddingObjects:(NSArray *)objects toArray:(NSArray *)array
{
    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:array];
    [mutableObjects addObjectsFromArray:objects];

    return [NSArray arrayWithArray:mutableObjects];
}

- (NSArray *)AEF_objectsAtSection:(NSUInteger)section
{
    NSArray *sectionObjects = nil;

    if (section < self.objects.count)
    {
        sectionObjects = [self.objects objectAtIndex:section];
    }
    else
    {
        sectionObjects = @[];
    }

    return sectionObjects;
}

@end
