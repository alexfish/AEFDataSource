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


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    
    if (indexPath.row < self.items.count)
    {
        id item = self.items[indexPath.row];
        self.configureCellBlock(cell, item, indexPath);
    }
    
    return cell;
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