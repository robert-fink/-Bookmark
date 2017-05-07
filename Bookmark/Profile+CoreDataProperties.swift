//
//  Profile+CoreDataProperties.swift
//  Bookmark
//
//  Created by Admin on 5/6/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var age: Int16
    @NSManaged public var birthday: NSDate?
    @NSManaged public var is_fiction: Bool
    @NSManaged public var is_non_fiction: Bool
    @NSManaged public var name: String?

}
