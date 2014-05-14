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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.collection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.collection.cellIdentifier
                                                            forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    
    if (item)
    {
        self.configureCellBlock(cell, item, indexPath);
    }
    
    return cell;
}


#pragma mark - Accessors

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = nil;

    if (indexPath.row < self.collection.count)
    {
        item = self.collection[indexPath.row];
    }
    
    return item;
}


@end