//
//  AEFTableViewDataSource.h
//  
//
//  Created by Alex Fish on 11/05/2014.
//
//

#import <Foundation/Foundation.h>


@class AEFTableCollection;


/**
 *  The configure cell callback called on `cellForRowAtIndexPath` to configure the
 *  cell to display an item
 *
 *  @param cell The cell that requires configuration
 *  @param item The item that the cell requires configuration with
 *
 */
typedef void (^AEFTableViewCellConfigureBlock)(UITableViewCell *cell, id item, NSIndexPath *indexPath);


/**
 *  A DataSource class that conforms to the UITableViewDataSource protocol,
 *  this class can be used to provide a UITableView with an array dataSource.
 *  Simple assign this class as your table view's dataSource and provide it with
 *  an array of objects.
 
 *  Insipired by: http://www.objc.io/issue-1/lighter-view-controllers.html
 */
@interface AEFTableViewDataSource : NSObject <UITableViewDataSource>

/**
 *  The data sources object collection, the collection contains data managed 
 *  by the table data source
 */
@property (nonatomic, copy, readonly) AEFTableCollection *collection;

/**
 *  The configure cell block
 */
@property (nonatomic, copy, readonly) AEFTableViewCellConfigureBlock configureCellBlock;

/**
 *  Return a new data source instance with a collection and configure block
 *
 *  @param collection         A collection of objects for the datasource to manage
 *  @param configureCellBlock A block called when a cell requires configuration inside `cellForRowAtIndexPath:`
 *
 *  @return A new table view data source instance with a collection and configure block
 */
- (id)initWithCollection:(AEFTableCollection *)collection
      configureCellBlock:(AEFTableViewCellConfigureBlock)configureCellBlock;

@end
