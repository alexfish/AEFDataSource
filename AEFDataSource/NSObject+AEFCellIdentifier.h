//
//  NSArray+AEFCellIdentifier.h
//  
//
//  Created by Alex Fish on 18/05/2014.
//
//

#import <Foundation/Foundation.h>

/**
 *  A Category that provides an additonal interface to NSObject
 *  so that a cell identifier string can be associated to an object
 */
@interface NSObject (AEFCellIdentifier)

/**
 *  The cell identifier associated to the object
 */
@property (nonatomic, strong) NSString *associatedCellIdentifer;

@end
