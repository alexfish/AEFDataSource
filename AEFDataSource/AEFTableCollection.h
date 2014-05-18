//
//  AEFTableCollection.h
//  
//
//  Created by Alex Fish on 14/05/2014.
//
//

#import "AEFBaseCollection.h"


FOUNDATION_EXPORT NSString * const AEFDefaultCellIdentifier;


/**
 *  A collection model for holding objects to display within 
 *  a UITableView data source. Table collections one dimensional
 *  and therefore are designed for use with simple
 *  table data source implementations that have one section
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

/**
 *  Return a cell identifier for the objects at a specified index in
 *  the collection
 *
 *  @param index An index within the bounds of the collection
 *
 *  @return A cell identifier associated to the objects at the
 *          specified index, if the index is beyond the bounds
 *          of the collection than an exception is raised.
 */
- (NSString *)cellIdentifierAtIndex:(NSUInteger)index;

@end
