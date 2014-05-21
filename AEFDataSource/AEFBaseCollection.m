//
//  AEFBaseCollection.m
//  
//
//  Created by Alex Fish on 13/05/2014.
//
//

#import "AEFBaseCollection.h"

// Class Extension
#import "AEFBaseCollection_Private.h"


@implementation AEFBaseCollection


#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects
{
    self = [super init];
    if (self)
    {
        _objects = [objects copy];
    }
    
    return self;
}


#pragma mark - Mutation

- (void)addObject:(id)object
{
    [self AEF_addObjects:@[object]];
}

- (void)removeObject:(id)object
{
    [self AEF_removeObjects:@[object]];
}

- (void)addObjects:(NSArray *)objects
{
    [self AEF_addObjects:objects];
}

- (void)removeObjects:(NSArray *)objects
{
    [self AEF_removeObjects:objects];
}


#pragma mark - Getters

- (NSInteger)count
{
    return self.objects.count;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return self.objects[idx];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return self.objects[index];
}


#pragma mark - Mutation (Private)

- (void)AEF_addObjects:(NSArray *)objects
{
    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:self.objects];
    [mutableObjects addObjectsFromArray:objects];
    
    self.objects = [NSArray arrayWithArray:mutableObjects];
}

- (void)AEF_removeObjects:(NSArray *)objects
{
    NSMutableArray *mutableObjects = [NSMutableArray arrayWithArray:self.objects];
    [mutableObjects removeObjectsInArray:objects];
    
    self.objects = [NSArray arrayWithArray:mutableObjects];
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AEFBaseCollection *collection = [[[self class] allocWithZone:zone] init];
    collection.objects = [self.objects copy];
    
    return collection;
}

@end
