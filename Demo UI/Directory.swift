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

    func generateDemoData() {
        for i in 0...10 {
            let place = Place(name: "Demo place n°\(i)" , address: "\(i) rue des Places", phoneNumber: nil, websiteURL: nil, wikipediaURL: nil, note: Float(i%5), numberOfReviews: i, latitude: nil, longitude: nil)
            storage.append(place)
        }
    }
}
