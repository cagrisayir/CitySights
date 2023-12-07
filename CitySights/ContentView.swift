//
//  ContentView.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 6.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    let dataService = DataService()
    
    var body: some View {
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
                await dataService.businessSearch()
            }
        }
    }
}

#Preview {
    ContentView()
}
