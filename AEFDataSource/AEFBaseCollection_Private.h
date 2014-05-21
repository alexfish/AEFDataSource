//
//  AEFBaseCollection_Private.h
//  
//
//  Created by Alex Fish on 13/05/2014.
//
//

#import "AEFBaseCollection.h"

/**
 *  Private class extension
 */
@interface AEFBaseCollection ()
/**
 *  An internal array of objects, this array contains
 *  all objects within the collection
 */
@property (nonatomic, copy) NSArray *objects;
@end
