//
//  PaymentsView.swift
//  CMB
//

import SwiftUI

struct PaymentsView: View {
    @EnvironmentObject var navigator: AppNavigator
    @StateObject private var viewModel = PaymentsViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            AppBackground()

            VStack(spacing: 0) {
             
                AppNavBar(
                    title: "Payments",
                
                )

                SegmentedPicker(
                    selected: $viewModel.selectedSegment,
                    options: ["Payments", "Schedules"]
                )
                .padding(.horizontal, 16)
                .padding(.top, 8)

                AddFavoriteBanner(onCreate: { print("Create favorite tapped") })
                    .padding(.top, 20)
                    .padding(.horizontal, 16)

            
                VStack(spacing: 0) {
               
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $viewModel.searchText)
                            .font(.system(size: 15))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .padding(.bottom, 12)

                  
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 12) {
                            ForEach(viewModel.filteredCategories) { category in
                                PaymentCategoryRow(category: category)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 100)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    AppRoundedCorner(radius: 16, corners: [.topLeft, .topRight])
                        .fill(Color(hex: "#F5F5F5"))
                        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: -4)
                )
                .padding(.top, 12)
              
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PaymentsView()
        .environmentObject(AppNavigator())
}
