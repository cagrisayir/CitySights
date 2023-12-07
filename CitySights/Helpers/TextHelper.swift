//
//  TextHelper.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 7.12.2023.
//

import Foundation

struct TextHelper {
    
    static func distanceAwayText(meter: Double) -> String {
        if meter > 1000 {
            return "\(Int(round(meter/1000))) km away"
        } else {
            return "\(Int(round(meter))) m away"
        }
    }
}
