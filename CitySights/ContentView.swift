//
//  ContentView.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 6.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State var businesses: [Business] = [Business]()
    let dataService = DataService()
    
    var body: some View {
        VStack{
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                Button {
                    // TODO: Implement query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .task {
                    businesses = await dataService.businessSearch()
                }
            }
            List(businesses) { business in
                Text(business.name ?? "N")
                    .bold()
            }
        }
    }
}

#Preview {
    ContentView()
}
