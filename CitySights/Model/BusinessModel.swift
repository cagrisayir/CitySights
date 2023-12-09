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
class BusinessModel: NSObject, CLLocationManagerDelegate {
    var businesses = [Business]()
    var query = ""
    var selectedBusiness: Business?
    
    var dataService = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses() {
        Task {
            businesses = await dataService.businessSearch(userLocation: currentUserLocation)
        }
    }
    
    func getUserLocation() {
        
        // Check if we have permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            locationManager.requestLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Detect if user allowed, then request location
        if(manager.authorizationStatus == .authorizedWhenInUse) {
            manager.requestLocation()
        }
        
//        switch manager.authorizationStatus {
//        case .authorizedAlways:
//        case .notDetermined
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if currentUserLocation == nil {
            currentUserLocation = locations.last?.coordinate
            // Call business search
            getBusinesses()
        }
        
        manager.stopUpdatingLocation()
    }
}
