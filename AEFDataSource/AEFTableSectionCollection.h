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
 *  Returns an object at a specified index in a specified section
 *
 *  @param index   The index the object is located at in the section
 *  @param section The section the object is located at in the collection
 *
 *  @return If index or section is beyond the range of the collection than an exception is raised
 */
- (id)objectAtIndex:(NSUInteger)index inSection:(NSUInteger)section;

@end
