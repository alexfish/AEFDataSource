//
//  AEFTableViewDataSource.m
//  
//
//  Created by Alex Fish on 11/05/2014.
//
//

#import "AEFTableViewDataSource.h"

// Models
#import "AEFTableCollection.h"
#import "AEFTableSectionCollection.h"

// Categories
#import "NSObject+AEFCellIdentifier.h"


/**
 *  Private class extension
 */
@interface AEFTableViewDataSource ()
/**
 *  Overwritten readonly properties
 */
@property (nonatomic, copy, readwrite) AEFTableCollection *collection;
@property (nonatomic, copy, readwrite) AEFTableViewCellConfigureBlock configureCellBlock;
@end


@implementation AEFTableViewDataSource



#pragma mark - Init

- (id)initWithCollection:(AEFTableCollection *)collection
      configureCellBlock:(AEFTableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self)
    {
        _collection         = [collection copy];
        _configureCellBlock = [configureCellBlock copy];
    }
    
    return self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = 0;

    if ([self.collection isMemberOfClass:[AEFTableCollection class]])
    {
        count = 1;
    }
    else if([self.collection isMemberOfClass:[AEFTableSectionCollection class]])
    {
        count = self.collection.count;
    }

    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;

    if ([self.collection isMemberOfClass:[AEFTableCollection class]])
    {
        count = self.collection.count;
    }
    else if([self.collection isMemberOfClass:[AEFTableSectionCollection class]])
    {
        count = [self.collection[section] count];
    }

    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item                 = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell   = nil;

    if (item)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:[item associatedCellIdentifer]
                                                                forIndexPath:indexPath];

        self.configureCellBlock(cell, item, indexPath);
    }

    return cell;
}


#pragma mark - Accessors

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = nil;

    if ([self.collection isMemberOfClass:[AEFTableCollection class]])
    {
        if (indexPath.row < self.collection.count)
        {
            item = self.collection[indexPath.row];
        }
    }
    else if([self.collection isMemberOfClass:[AEFTableSectionCollection class]])
    {
        if (indexPath.section < self.collection.count)
        {
            if (indexPath.row < [self.collection[indexPath.section] count])
            {
                item = self.collection[indexPath.section][indexPath.row];
            }
        }
    }

    return item;
}


@end