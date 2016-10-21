//
//  CDPlace+CoreDataProperties.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation
import CoreData 

extension CDPlace {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPlace> {
        return NSFetchRequest<CDPlace>(entityName: "CDPlace");
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var note: Float
    @NSManaged public var city: CDCity?

}
