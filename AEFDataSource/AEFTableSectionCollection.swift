//
//  AEFTableSectionCollection.swift
//  AEFDataSource Example
//
//  Created by Alex Fish on 6/3/14.
//  Copyright (c) 2014 alexefish. All rights reserved.
//

import UIKit

class AEFTableSectionCollection : AEFTableCollection {
    
    init(objects: AnyObject[]) {
        super.init(objects: [objects])
    }
    
    init(objects: AnyObject[]!, cellIdentifier: String!) {
        super.init(objects: [objects], cellIdentifier: cellIdentifier)
    }
    
    // Mark - Getters
    
    func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String! {
        var cellIdentifier: String = ""
        
        if let object: AnyObject  = self.objectAtIndexPath(indexPath) {
            let castObject = object as NSObject
            cellIdentifier = castObject.associatedCellIdentifer
        }
        
        return cellIdentifier
    }
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject! {
        let rowObjects: NSArray = self.objectAtIndex(indexPath.row) as NSArray
        
        return rowObjects.objectAtIndex(indexPath.section)
    }
    
    // Mark - Cell Identifier
    
    override func AEF_associateCellIdentifier(cellIdentifier: String!, toObjects objects: AnyObject[]!)
    {
        for object : AnyObject in objects {
            if object is NSArray {
                let sectionObjects = object as NSArray
                for sectionObject: AnyObject in sectionObjects {
                    let castObject = sectionObject as NSObject
                    castObject.associatedCellIdentifer = cellIdentifier
                }
            } else {
                let castObject = object as NSObject
                castObject.associatedCellIdentifer = cellIdentifier
            }
        }
    }
    
    // Mark - Mutation
    
    func addObjects(objects: NSArray, toSection section: Int, withCellIdentifier cellIdentifier: NSString) {
        self.AEF_associateCellIdentifier(cellIdentifier, toObjects: objects)
        
        let sectionObjects: NSArray = self.AEF_objects(atSection: section)
        let updatedSectonObjects: NSArray = self.AEF_arrayByAdding(objects, toArray: sectionObjects)
        
        let mutableObjects: NSMutableArray = NSMutableArray(array: self.objects)
        
        if section < mutableObjects.count {
            mutableObjects.replaceObjectAtIndex(section, withObject: updatedSectonObjects)
        } else {
            mutableObjects.addObject(updatedSectonObjects)
        }
        
        self.objects = NSArray(array: mutableObjects)
    }
    
    func removeObjects(objects: NSArray, fromSection section: Int) {
        if section >= self.objects.count {
            return
        }
        
        let castArray: NSArray = self.objects as NSArray
        let sectionObjects: NSArray = castArray.objectAtIndex(section) as NSArray
        let updatedSectionObjects: NSArray = self.AEF_arrayByRemoving(objects, fromArray: sectionObjects)
        
        let mutableObjects: NSMutableArray = NSMutableArray(array: self.objects)
        mutableObjects.replaceObjectAtIndex(section, withObject: updatedSectionObjects)
        
        self.objects = NSArray(array: mutableObjects)
    }
    
    func AEF_arrayByRemoving(objects: NSArray, fromArray array: NSArray) -> NSArray {
        let mutableArray: NSMutableArray = NSMutableArray(array: array)
        mutableArray.removeObjectsInArray(objects)
        
        return NSArray(array: mutableArray)
    }
    
    func AEF_arrayByAdding(objects: NSArray, toArray array: NSArray) -> NSArray {
        let mutableArray: NSMutableArray = NSMutableArray(array: array)
        mutableArray.addObjectsFromArray(objects)
        
        return NSArray(array: mutableArray)
    }
    
    func AEF_objects(atSection section: Int) -> NSArray {
        var sectionObjects: NSArray
        
        if section < self.objects.count {
            let objectsArray: NSArray = self.objects as NSArray
            sectionObjects = objectsArray.objectAtIndex(section) as NSArray
        } else {
            sectionObjects = NSArray()
        }
        
        return sectionObjects
    }
}