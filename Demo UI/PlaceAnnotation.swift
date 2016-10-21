//
//  PlaceAnnotation.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {

    let place: Place

    init?(place: Place) {
        guard place.latitude != nil && place.longitude != nil else {
            return nil
        }
        self.place = place
    }

    var title: String? {
        return place.name
    }

    var subtitle: String? {
        return place.address
    }

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!)
    }
}
