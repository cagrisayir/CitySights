//
//  DataService.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 7.12.2023.
//

import Foundation
import CoreLocation

struct DataService {
    
    let api_key = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?) async -> [Business] {
        // Check if the api key exist
        guard api_key != nil else {
            return [Business]()
        }
        
        // default
        var lat = 37.033765097330885
        var long = 35.29395014634649
        
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        // Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10") {
            
            // Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(api_key!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // Send request
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Parse the JSON
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(BusinessSearch.self, from: data)
                    return result.businesses
                } catch {
                    print("Parsing Error", error)
                }
                
                
            } catch {
                print("businessSearch request error", error)
            }
        }
        return [Business]()
    }
    
}
