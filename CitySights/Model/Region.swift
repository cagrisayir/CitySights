//
//  Region.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 7.12.2023.
//

import Foundation

struct Region: Decodable {
    var center: Coordinate?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}
