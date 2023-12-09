//
//  ListView.swift
//  CitySights
//
//  Created by Omer Cagri Sayir on 9.12.2023.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        List{
            ForEach(model.businesses) { b in
                VStack(spacing: 20) {
                    HStack(spacing: 0) {
                        Image("list-placeholder-image")
                            .padding(.trailing, 16)
                        VStack(alignment: .leading) {
                            Text(b.name ?? "Restaurant")
                                .font(Font.system(size: 15))
                                .bold()
                            
                            Text(TextHelper.distanceAwayText(meter: b.distance ?? 0))
                                .font(Font.system(size: 15))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        Image("regular_\(b.rating ?? 0)")
                    }
                    Divider()
                }
                    .onTapGesture {
                        model.selectedBusiness = b
                    }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
}