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

- (void)addObjects:(NSArray *)objects
         toSection:(NSUInteger)section
withCellIdentifier:(NSString *)cellIdentifier
{
    [super AEF_associateCellIdentifier:cellIdentifier toObjects:objects];

    NSArray *sectionObjects = nil;

    if (section < self.objects.count)
    {
        sectionObjects = [self.objects objectAtIndex:section];
    }
    else
    {
        sectionObjects = @[];
    }

    NSMutableArray *mutableSectionObjects = [NSMutableArray arrayWithArray:sectionObjects];
    [mutableSectionObjects addObjectsFromArray:objects];
    sectionObjects = [NSArray arrayWithArray:mutableSectionObjects];

    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:self.objects];
    [mutableObjects replaceObjectAtIndex:section withObject:sectionObjects];

    self.objects = [NSArray arrayWithArray:mutableObjects];
}

- (void)removeObjects:(NSArray *)objects fromSection:(NSUInteger)section
{
    NSArray *sectionObjects = [self.objects objectAtIndex:0];
    NSMutableArray *mutableSectionObjects = [NSMutableArray arrayWithArray:sectionObjects];
    [mutableSectionObjects removeObjectsInArray:objects];
    sectionObjects = [NSArray arrayWithArray:mutableSectionObjects];

    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:self.objects];
    [mutableObjects replaceObjectAtIndex:section withObject:sectionObjects];

    self.objects = [NSArray arrayWithArray:mutableObjects];
}


@end
