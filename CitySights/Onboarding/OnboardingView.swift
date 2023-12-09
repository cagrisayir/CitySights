//
//  OnboardingView.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 9.12.2023.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @State var currentView: Int = 0
    
    var body: some View {
        TabView(selection: $currentView) {
            OnboardingViewDetails(
                bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city!", buttonText: "Continue") {
                    withAnimation {
                        currentView = 1
                    }
                }
                .tag(0)
            
            OnboardingViewDetails(
                bgColor: Color(.green), headline: "Discover your city", subHeadline: "We will show you the best restaurants, venues, and more, based on your location", buttonText: "Done") {
                    dismiss()
                }
                .tag(1)
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
