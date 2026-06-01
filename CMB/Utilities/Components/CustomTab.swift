//
//  CustomTab.swift
//  CMB
//

import SwiftUI

struct CustomTab: View {
    @EnvironmentObject var tabCoordinator: TabCoordinator
    @EnvironmentObject var navigator: AppNavigator

    var body: some View {
        ZStack(alignment: .top) {

            Color.tabBarBackground
                .ignoresSafeArea(edges: .bottom)

            ZStack(alignment: .top) {

                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        if tab == .qr {
                            Spacer()
                                .frame(width: 80)
                        } else {
                            TabItemView(
                                icon: tab.icon,
                                label: tab.title,
                                isActive: tabCoordinator.selectedTab == tab
                            )
                            .onTapGesture {
                                tabCoordinator.selectedTab = tab
                            }
                        }
                    }
                }
                .frame(height: 50)
                .padding(.top, 8)

       
                Button {
                    navigator.openQRScanner()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.tabBarBackground)
                            .frame(width: 72, height: 72)

                        Circle()
                            .fill(Color.brandPrimary)
                            .frame(width: 60, height: 60)

                        Image(Tab.qr.icon)
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .offset(y: -20)
            }
        }
        .frame(height: 20)
    }
}

struct TabItemView: View {
    let icon: String
    let label: String
    var isActive: Bool

    var body: some View {
        VStack(spacing: 4) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)

            Text(label)
                .font(.system(size: 11, weight: isActive ? .semibold : .regular))
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(isActive ? Color.brandPrimary : Color.labelGray)
        
    }
}
