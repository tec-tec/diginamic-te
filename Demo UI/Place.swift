//
//  Place.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 18/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

struct Place: Equatable {

    let name: String
    let adress: String
    let phoneNumber: String?
    let websiteURL: URL?
    let wikipediaURL: URL?
    let note: Float
    let numberOfReviews: Int

    let latitude: Double?
    let longitude: Double?

    static func ==(lhs: Place, rhs: Place) -> Bool {

        if lhs.name == rhs.name && lhs.adress == rhs.adress {
            return true
        }
        return false
    }
}
