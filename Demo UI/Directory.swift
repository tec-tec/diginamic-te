//
//  Directory.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 18/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

class Directory {

    private var storage = [Place]()

    var allPlaces: [Place] {
        return storage
    }

    func add(place: Place) {
        guard !storage.contains(place) else { return }
        storage.append(place)
    }

    func remove(place: Place) {
        guard let index = storage.index(of: place) else { return }
        storage.remove(at: index)
    }
}
