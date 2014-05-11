//
//  AEFTableViewDataSource.h
//  
//
//  Created by Alex Fish on 11/05/2014.
//
//

#import <Foundation/Foundation.h>

/**
 *  The configure cell callback called on `cellForRowAtIndexPath` to configure the
 *  cell to display an item
 *
 *  @param cell The cell that requires configuration
 *  @param item The item that the cell requires configuration with
 *
 */
typedef void (^AEFTableViewCellConfigureBlock)(id cell, id item, NSIndexPath *indexPath);


/**
 *  A DataSource class that conforms to the UITableViewDataSource protocol,
 *  this class can be used to provide a UITableView with an array dataSource.
 *  Simple assign this class as your table view's dataSource and provide it with
 *  an array of objects.
 
 *  Insipired by: http://www.objc.io/issue-1/lighter-view-controllers.html
 */
@interface AEFTableViewDataSource : NSObject <UITableViewDataSource>


/**
 *  The datasource's items
 */
@property (nonatomic, copy, readonly) NSArray *items;

/**
 *  The datasource's reuse cell identified
 */
@property (nonatomic, copy, readonly) NSString *cellIdentifier;

/**
 *  The configure cell block
 */
@property (nonatomic, copy, readonly) AEFTableViewCellConfigureBlock configureCellBlock;


/**
 *  Init a new array dataSource
 *
 *  @param items               An NSArray of items to provide to the UITableViewDataSource
 *  @param cellIdentifier      A unique cell reuse cell identifier
 *  @param configureCellBlock  A block called when a cell requires configuration inside `cellForRowAtIndexPath:`
 *
 *  @return A new array datasource instance
 */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 configureCellBlock:(AEFTableViewCellConfigureBlock)configureCellBlock;

/**
 *  Add items to the data source's items array, after adding items you
 *  should call reloadData on your view controller's data source to see
 *  the new items
 *
 *  @param items An array of items to add
 */
- (void)addItems:(NSArray *)items;

/**
 *  Remove items from the data source's items array, after removing items
 *  you should call reloadData on your view controller's data source to see
 *  the items removed
 *
 *  @param items An array of items to remove
 */
- (void)removeItems:(NSArray *)items;

@end
