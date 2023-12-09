//
//  OnboardingViewDetails.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 9.12.2023.
//

import SwiftUI

struct OnboardingViewDetails: View {
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonText: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack (spacing: 0){
                Spacer()
                
                Image("onboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .clipShape(.circle)
                
                Text(headline)
                    .font(Font.system(size: 22))
                    .bold()
                    .padding(.top, 32)
                
                Text(subHeadline)
                    .padding(.top, 4)
                    .padding(.horizontal)
                
                Spacer()
                
                Button{
                    // TODO: action
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                        
                        Text(buttonText)
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)
            }
            .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}
