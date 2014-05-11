//
//  AEFTableViewDataSource.m
//  
//
//  Created by Alex Fish on 11/05/2014.
//
//

#import "AEFTableViewDataSource.h"


/**
 *  Private class extension
 */
@interface AEFTableViewDataSource ()
/**
 *  Overwritten readonly properties
 */
@property (nonatomic, copy, readwrite) NSArray *items;
@property (nonatomic, copy, readwrite) NSString *cellIdentifier;
@property (nonatomic, copy, readwrite) AEFTableViewCellConfigureBlock configureCellBlock;
@end


@implementation AEFTableViewDataSource



#pragma mark - Init

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 configureCellBlock:(AEFTableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self)
    {
        _items              = [items copy];
        _cellIdentifier     = [cellIdentifier copy];
        _configureCellBlock = [configureCellBlock copy];
    }
    
    return self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = 0;
    
    if ([self.items[0] isKindOfClass:[NSArray class]])
    {
        count = self.items.count;
    }
    else
    {
        count = 1;
    }
    
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    
    if ([self.items[section] isKindOfClass:[NSArray class]])
    {
        count = [self.items[section] count];
    }
    else
    {
        count = self.items.count;
    }
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
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
    
    if (indexPath.section < self.items.count
        && [self.items[indexPath.section] isKindOfClass:[NSArray class]])
    {
        if (indexPath.row < [self.items[indexPath.section] count])
        {
            item = self.items[indexPath.section][indexPath.row];
        }
    }
    else if (indexPath.row < self.items.count)
    {
        item = self.items[indexPath.row];
    }
    
    return item;
}


#pragma mark - Mutation

- (void)addItems:(NSArray *)items
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.items];
    
    [mutableArray addObjectsFromArray:items];
    
    self.items = [NSArray arrayWithArray:mutableArray];
}

- (void)removeItems:(NSArray *)items
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.items];
    
    [mutableArray removeObjectsInArray:items];
    
    self.items = [NSArray arrayWithArray:mutableArray];
}


@end