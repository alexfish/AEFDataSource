//
//  AEFTableCollection.h
//  
//
//  Created by Alex Fish on 14/05/2014.
//
//

#import "AEFBaseCollection.h"

/**
 *  A collection model for holding objects to display within 
 *  a UITableView data source. The table collection holds batches
 *  of objects with each batch representing a table view section.
 */
@interface AEFTableCollection : AEFBaseCollection

/**
 *  A cell identifier associated to the table collection
 */
@property (nonatomic, copy, readonly) NSString *cellIdentifier __attribute__((const));

/**
 *  Return a new table collection containing objects associated to a cell identifier
 *
 *  @param objects        An array of objects to add to the collection
 *  @param cellIdentifier A reusable cell identifier associated to the objects
 *
 *  @return A table collection instance with objects associated to a cell identifier
 */
- (instancetype)initWithObjects:(NSArray *)objects
                 cellIdentifier:(NSString *)cellIdentifier;

@end
