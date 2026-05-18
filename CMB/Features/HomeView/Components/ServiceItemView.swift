//
//  ServiceItemView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 15/5/26.
//

import SwiftUI

struct ServiceItemView: View {
    let service: ServiceModel

    var body: some View {
        VStack {
            
            Image(service.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 57, height: 78)
            
            Text(service.title)
                .font(.caption.bold())
        }
    }
}


