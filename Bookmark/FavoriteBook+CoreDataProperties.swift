//
//  FavoriteBook+CoreDataProperties.swift
//  Bookmark
//
//  Created by Admin on 5/6/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation
import CoreData


extension FavoriteBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteBook> {
        return NSFetchRequest<FavoriteBook>(entityName: "FavoriteBook")
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var bookDescription: String?

}
