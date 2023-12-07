//
//  DataService.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 7.12.2023.
//

import Foundation

struct DataService {
    
    let api_key = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async {
        // Check if the api key exist
        guard api_key != nil else {
            return
        }
        
        // Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=37.785834&longitude=-122.406417&categories=restaurants&limit=10") {
            
            // Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(api_key!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print(data)
                print(response)
            } catch {
                print("businessSearch request error", error)
            }
        }
        
        
        
    }
    
}
