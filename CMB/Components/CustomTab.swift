import SwiftUI

struct CustomTab: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack(alignment: .top) {

            Color.tabBarBackground
                .ignoresSafeArea(edges: .bottom)

            ZStack(alignment: .top) {

           
                HStack(spacing: 0) {
                    TabItemView(
                        icon: "ic_chipmong",
                        label: "Account",
                        isActive: selectedTab == 0
                    )
                    .onTapGesture { selectedTab = 0 }

                    TabItemView(
                        icon: "ic_benifits",
                        label: "Benefits",
                        isActive: selectedTab == 1
                    )
                    .onTapGesture { selectedTab = 1 }

              
                    Spacer()
                        .frame(width: 80)

                    TabItemView(
                        icon: "ic_withdrawal",
                        label: "WIthdraw",
                        isActive: selectedTab == 2
                    )
                    .onTapGesture { selectedTab = 2 }

                    TabItemView(
                        icon: "ic_supports",
                        label: "Support",
                        isActive: selectedTab == 3
                    )
                    .onTapGesture { selectedTab = 3 }
                }
                .frame(height: 60)
                .padding(.top, 8)

          
                Button {
                    print("QR tapped")
                } label: {
                    ZStack {
                    
                        Circle()
                            .fill(Color.tabBarBackground)
                            .frame(width: 72, height: 72)

                 
                        Circle()
                            .fill(Color.brandPrimary)
                            .frame(width: 60, height: 60)

                        Image("ic_scanqr")
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .offset(y: -20)
            }
        }
        .frame(height: 80)
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
        .foregroundColor(
            isActive
                ? Color.brandPrimary
            : Color.labelGray
        )
    }
}
