//
//  AEFTableSectionCollection.h
//  
//
//  Created by Alex Fish on 18/05/2014.
//
//

#import "AEFTableCollection.h"

/**
 *  A table collection subclass that contains objects grouped into
 *  sections. 
 *
 *  A section is displayed within a AEFTableVeiwDataSource's sections
 */
@interface AEFTableSectionCollection : AEFTableCollection

/**
 *  Return an object at a specified indexPath of the collection
 *
 *  @param indexPath An indexPath within the bounds of the collection
 *
 *  @return An object at the specified indexPath, if the indexPath is
 *          beyond the bounds of the collection than an exception is raised.
 */
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Return a cell identifier for the objects at a specified indexPath in
 *  the collection
 *
 *  @param indexPath An indexPath within the bounds of the collection
 *
 *  @return A cell identifier associated to the objects at the
 *          specified indexPath, if the indexPath is beyond the bounds
 *          of the collection than an exception is raised.
 */
- (NSString *)cellIdentifierAtIndexPath:(NSIndexPath *)indexPath;

@end
