//
//  Directory.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 18/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

class Directory {

    static let instance = Directory()

    private var storage: [Place]

    private init() {
        storage = []
    }

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

        let place = Place(name: "Demo place n°00" , address: "00 rue des Places", phoneNumber: nil, websiteURL: nil, wikipediaURL: nil, note: 2.5, numberOfReviews: 5, latitude: nil, longitude: nil, source: .internet)
        storage.append(place)

        for i in 0...3 {
            let place = Place(name: "Demo place n°\(i)" , address: "\(i) rue des Places", phoneNumber: nil, websiteURL: nil, wikipediaURL: nil, note: Float(i%5), numberOfReviews: i, latitude: nil, longitude: nil)
            storage.append(place)
        }
    }
}
