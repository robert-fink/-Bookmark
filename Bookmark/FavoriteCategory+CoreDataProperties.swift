//
//  FavoriteCategory+CoreDataProperties.swift
//  Bookmark
//
//  Created by Admin on 5/6/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation
import CoreData


extension FavoriteCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteCategory> {
        return NSFetchRequest<FavoriteCategory>(entityName: "FavoriteCategory")
    }

    @NSManaged public var name: String?

}
