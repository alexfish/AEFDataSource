//
//  AEFTableCollection_Private.h
//  
//
//  Created by Alex Fish on 20/05/2014.
//
//

#import "AEFTableCollection.h"

/**
 *  Private Class Extension
 */
@interface AEFTableCollection ()

/**
 *  Overwritten readonly properties
 */
@property (nonatomic, copy, readwrite) NSString *cellIdentifier;

/**
 *  Associate each object in an array with a cell identifier string
 *
 *  @param cellIdentifier A UITableViewCell cell identifier to associate with the object
 *  @param objects        An array of objects to associate with the specified cell identifier
 */
- (void)AEF_associateCellIdentifier:(NSString *)cellIdentifier toObjects:(NSArray *)objects;

@end
