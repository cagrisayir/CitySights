//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 8.12.2023.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                
                VStack{
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            
            ZStack (alignment: .leading){
                Rectangle()
                    .foregroundStyle(business?.is_closed == true ? .red : .green)
                Text(business?.is_closed == true ? "Closed" : "Open")
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
            }
            .frame(height: 36)
            
            ScrollView {
                VStack(alignment:.leading, spacing: 0) {
                    Text(business?.name! ?? "Restaurantname")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    
                    Text("\(business?.location?.address1 ?? "Yurt"), \(business?.location?.city ?? "Adana")")
                        .padding(.bottom, 10)
                    
                    Image("regular_\(business?.rating ?? 0)")
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    // For Number
                    HStack {
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    // for website
                    HStack {
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(2)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    // for reviews
                    HStack{
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.review_count ?? 0) reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Spacer()
                }
            }.padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BusinessDetailView(business: Business(id: "asd", is_closed: true, rating: 5.0, name: "Cagri bufe", phone: "+90 545 268 6099", review_count: 399, url: "www.cagrisayir.dev"))
}
