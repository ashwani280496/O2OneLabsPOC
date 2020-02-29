//
//  Photo+CoreDataProperties.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 29/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var descri: String?
    @NSManaged public var image: Data?
    @NSManaged public var imageUrl: String?
    @NSManaged public var latitude: Double
    @NSManaged public var location: String?
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var rating: Double
    @NSManaged public var camera: String?
    @NSManaged public var lens: String?
    @NSManaged public var userName: String?
    @NSManaged public var userAbout: String?
    @NSManaged public var userImageUrl: String?

}
