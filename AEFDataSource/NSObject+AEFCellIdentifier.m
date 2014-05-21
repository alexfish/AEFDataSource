//
//  NSArray+AEFCellIdentifier.m
//  
//
//  Created by Alex Fish on 18/05/2014.
//
//

#import "NSObject+AEFCellIdentifier.h"

// Frameworks
#include <objc/runtime.h>


@implementation NSObject (AEFCellIdentifier)

@dynamic associatedCellIdentifer;


#pragma mark - Setters

- (void)setAssociatedCellIdentifer:(NSString *)cellIdentifier
{
    objc_setAssociatedObject(self, @selector(associatedCellIdentifer), cellIdentifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - Getters

- (NSString *)associatedCellIdentifer
{
    return objc_getAssociatedObject(self, @selector(associatedCellIdentifer));
}

@end
