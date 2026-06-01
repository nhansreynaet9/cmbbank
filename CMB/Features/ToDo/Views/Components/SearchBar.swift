//
//  SearchBar.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//
import SwiftUI

 struct TodoSearchBarView: View {

    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.white.opacity(0.6))
            TextField("", text: $searchText)
                .placeholder(when: searchText.isEmpty) {
                    Text("Search todos...").foregroundColor(.white.opacity(0.4))
                }
                .foregroundColor(.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.6))
                }
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.15))
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }
}
