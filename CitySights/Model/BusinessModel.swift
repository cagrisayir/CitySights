//
//  BusinessModel.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 9.12.2023.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel {
    var businesses = [Business]()
    var query = ""
    var selectedBusiness: Business?
    
    var dataService = DataService()
    var locationManager = CLLocationManager()
    
    func getBusinesses() {
        Task {
            businesses = await dataService.businessSearch()
        }
    }
    
    func getUserLocation() {
        
        // Check if we have permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
