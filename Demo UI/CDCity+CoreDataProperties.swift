//
//  CDCity+CoreDataProperties.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation
import CoreData 

extension CDCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity");
    }

    @NSManaged public var name: String?
    @NSManaged public var places: NSSet?

}

// MARK: Generated accessors for places
extension CDCity {

    @objc(addPlacesObject:)
    @NSManaged public func addToPlaces(_ value: CDPlace)

    @objc(removePlacesObject:)
    @NSManaged public func removeFromPlaces(_ value: CDPlace)

    @objc(addPlaces:)
    @NSManaged public func addToPlaces(_ values: NSSet)

    @objc(removePlaces:)
    @NSManaged public func removeFromPlaces(_ values: NSSet)

}
