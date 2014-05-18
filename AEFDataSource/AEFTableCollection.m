//
//  AEFTableCollection.m
//  
//
//  Created by Alex Fish on 14/05/2014.
//
//

#import "AEFTableCollection.h"


/**
 *  Constants
 */
NSString * const AEFDefaultCellIdentifier = @"AEFDefaultCellIdentifier";


/**
 *  Private Class Extension
 */
@interface AEFTableCollection ()
/**
 *  Overwritten readonly properties
 */
@property (nonatomic, copy, readwrite) NSString *cellIdentifier;
@end


@implementation AEFTableCollection


#pragma mark - Init

- (instancetype)initWithObjects:(NSArray *)objects
{
    return [self initWithObjects:objects cellIdentifier:AEFDefaultCellIdentifier];
}

- (instancetype)initWithObjects:(NSArray *)objects
                 cellIdentifier:(NSString *)cellIdentifier
{
    self = [super initWithObjects:objects];
    if (self)
    {
        _cellIdentifier = [cellIdentifier copy];
    }
    
    return self;
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AEFTableCollection *collection = [super copyWithZone:zone];
    collection.cellIdentifier = [self.cellIdentifier copy];
    
    return collection;
}

@end
