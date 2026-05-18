import SwiftUI

struct CustomTab: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
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
                    .frame(width: 70)

                TabItemView(
                    icon: "ic_withdrawal",
                    label: "Withdrawal",
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
            .padding(.horizontal, 10)
            .frame(height: 70)
            .background(Color(hex: "B8E1CF")) // Your bar background
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: .black.opacity(0.08), radius: 10, y: -2)

            
            Button {
                print("QR tapped")
            } label: {
                ZStack {
                    Circle()
                        .fill(Color(hex: "00A859"))
                        .frame(width: 65, height: 65)

                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                }
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 5)
                }
                .shadow(color: .black.opacity(0.15), radius: 8, y: 4)
            }
            .offset(y: -28)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct TabItemView: View {
    let icon: String
    let label: String
    var isActive: Bool
    
    var body: some View {
        VStack(spacing: 5) {
           
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24) 
            
            Text(label)
                .font(.system(size: 11, weight: .medium))
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(
            isActive
            ? Color(hex: "00A859")
            : Color.black.opacity(0.5)
        )
    }
}
