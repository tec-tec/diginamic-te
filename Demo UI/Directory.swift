//
//  Directory.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 18/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

class Directory {

    private var storage = [Place]()

    var allPlaces: [Place] {
        return storage
    }

    func add(place: Place) {
        storage.append(place)
    }
}
