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

/**
 *  Add objects to a section associated to a cell identifier
 *
 *  @param objects        An array of objects to add to the specified section
 *  @param section        The seciton of the collection to add objects to.
 *  @param cellIdentifier A cell idtentifier to associate to the objects
 */
- (void)addObjects:(NSArray *)objects toSection:(NSUInteger)section withCellIdentifier:(NSString *)cellIdentifier;

/**
 *  Remove objects from a section of the collection
 *
 *  @param objects The objects to remove from the collection's section
 *  @param section The section to remove objects from, if the section is
 *                 empty than an exception is raised.
 */
- (void)removeObjects:(NSArray *)objects fromSection:(NSUInteger)section;

@end
