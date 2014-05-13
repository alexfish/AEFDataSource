//
//  AEFBaseCollection.h
//  
//
//  Created by Alex Fish on 13/05/2014.
//
//

#import "AEFBaseModel.h"

/**
 *  An abstract collection class, a collection represents
 *  a mutable ordered collection of models that can be held in a data source.
 */
@interface AEFBaseCollection : AEFBaseModel

/**
 *  Return a new collection instance containing an array of objects.
 *
 *  @param objects An array of objects contained in the new instance
 *
 *  @return A collection instance containing objects
 */
- (id)initWithObjects:(NSArray *)objects;

/**
 *  Append an object to the end of the collection
 *
 *  @param object An object to add to the collection
 */
- (void)addObject:(id)object;

/**
 *  Remove an object from the collection
 *
 *  @param object An object to remove from the collection
 */
- (void)removeObject:(id)object;

/**
 *  Add objects to the collection, objects will appended to the end of the
 *  collection
 *
 *  @param objects An array of objects to add
 */
- (void)addObjects:(NSArray *)objects;

/**
 *  Remove objects from the collection
 *  @param objects An array of objects to remove
 */
- (void)removeObjects:(NSArray *)objects;

@end
