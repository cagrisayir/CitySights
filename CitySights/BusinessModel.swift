//
//  BusinessModel.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 9.12.2023.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    var businesses = [Business]()
    var query = ""
    var selectedBusiness: Business?
    
    var dataService = DataService()
    
    func getBusinesses() {
        Task {
            businesses = await dataService.businessSearch()
        }
    }
}
