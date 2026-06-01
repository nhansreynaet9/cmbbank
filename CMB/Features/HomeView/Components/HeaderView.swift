import SwiftUI

struct HeaderView: View {
    var scrollOffset: CGFloat
    @ObservedObject var navigator: AppNavigator
    
    private var progress: CGFloat {
        min(max(scrollOffset / 100, 0), 1)
    }
    private var headerHeight: CGFloat { 160 - (progress * 40) }
    private var profileOffset: CGFloat { 112 - (progress * 46) }
    private var imageScale: CGFloat { 1 - (progress * 0.10) }
    private var textScale: CGFloat  { 1 - (progress * 0.04) }
    private var subtitleOpacity: CGFloat { 1 - progress }

    var body: some View {
        ZStack(alignment: .topLeading) {

            Color.appBackground
                .ignoresSafeArea()

            GeometryReader { _ in
                Image("bg_tower")
                    .resizable()
                    .frame(width: 266.3, height: 711.57)
                    .opacity(0.5)
                    .offset(x: 150, y: 43)
                    .allowsHitTesting(false)
            }

            HStack {
                Spacer()
                HStack(spacing: 12) {

                    Button {
                        navigator.openNotifications()
                    } label: {
                        Image("ic_bell")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }

                    Button {
                        navigator.openQRScanner()
                    } label: {
                        Image("ic_qr")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color(red: 196/255, green: 39/255, blue: 46/255))
                            .cornerRadius(10)
                    }
                }
                .padding(.trailing, 16)
            }
            .padding(.top, 56)
            HStack(spacing: 12) {
                ProfileImageView(imageName: "Profile")
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .scaleEffect(imageScale)
                    .onTapGesture { navigator.openProfile() }  // ← add this

                VStack(alignment: .leading, spacing: 2) {
                    Text("NHAN SREYNAET")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)

                    Text("Member since '21")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .opacity(subtitleOpacity)
                }
                .scaleEffect(textScale, anchor: .leading)

                Spacer()
            }
            
            .frame(height: 40)
            .padding(.horizontal, 16)
            .offset(y: profileOffset)
        }
        .frame(height: headerHeight)
        .clipped()
        .animation(.easeInOut(duration: 0.22), value: progress)
    }
}
