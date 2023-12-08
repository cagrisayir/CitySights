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
        Text(business?.name ?? "Name")
    }
}

#Preview {
    BusinessDetailView()
}
