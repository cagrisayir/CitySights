//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 7.12.2023.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses: [Business] = [Business]()
    var region: Region = Region()
    var total: Int = 0
}
