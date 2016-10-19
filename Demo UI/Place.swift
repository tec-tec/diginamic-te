//
//  Place.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 18/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

struct Place: Equatable {

    enum Source: String {
        case local, internet
    }

    let name: String
    let address: String
    let phoneNumber: String?
    let websiteURL: URL?
    let wikipediaURL: URL?
    let note: Float
    let numberOfReviews: Int

    let latitude: Double?
    let longitude: Double?

    let source: Source

    init(name: String, address: String, phoneNumber: String?, websiteURL: URL?, wikipediaURL: URL?, note: Float, numberOfReviews: Int, latitude: Double?, longitude: Double?, source: Source = .local) {
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
        self.websiteURL = websiteURL
        self.wikipediaURL = wikipediaURL
        self.note = note
        self.numberOfReviews = numberOfReviews
        self.latitude = latitude
        self.longitude = longitude
        self.source = source
    }

    static func ==(lhs: Place, rhs: Place) -> Bool {

        if lhs.name == rhs.name && lhs.address == rhs.address {
            return true
        }
        return false
    }
}
