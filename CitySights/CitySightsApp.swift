//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 6.12.2023.
//

import SwiftUI

@main
struct CitySightsApp: App {
    @State var model = BusinessModel()
    @State var needsOnBoarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: $needsOnBoarding, onDismiss: {
                    needsOnBoarding = false
                }, content: {
                    OnboardingView()
                })
        }
    }
}
