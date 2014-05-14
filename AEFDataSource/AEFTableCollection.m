//
//  AEFTableCollection.m
//  
//
//  Created by Alex Fish on 14/05/2014.
//
//

#import "AEFTableCollection.h"

@implementation AEFTableCollection


#pragma mark - Mutation

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

@end
