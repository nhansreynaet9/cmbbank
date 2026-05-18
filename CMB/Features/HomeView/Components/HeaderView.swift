import SwiftUI

struct HeaderrView: View {
    
    var scrollOffset: CGFloat
    
    // MARK: - Progress
    private var progress: CGFloat {
        let value: CGFloat = scrollOffset / 100.0
        return min(max(value, 0.0), 1.0)
    }
    
    // MARK: - Dynamic Height
    private var headerHeight: CGFloat {
        let collapsed: CGFloat = progress * 45.0
        return 130.0 - collapsed
    }
    
    // MARK: - Profile Position
    private var profileY: CGFloat {
        let movement: CGFloat = progress * 38.0
        return 55.0 - movement
    }
    
    // MARK: - Image Scale
    private var imageScale: CGFloat {
        let shrink: CGFloat = progress * 0.12
        return 1.0 - shrink
    }
    
    // MARK: - Text Scale
    private var textScale: CGFloat {
        let shrink: CGFloat = progress * 0.05
        return 1.0 - shrink
    }
    
    // MARK: - Opacity
    private var fadeOpacity: Double {
        let fade: CGFloat = progress * 0.15
        return Double(1.0 - fade)
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            // MARK: - Top Right Icons
            HStack {
                
                Spacer()
                
                HStack(spacing: 12) {
                    
                    Image(systemName: "bell")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                    
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                            Color(
                                red: 196/255,
                                green: 39/255,
                                blue: 46/255
                            )
                        )
                        .cornerRadius(10)
                }
                .padding(.trailing, 16)
            }
            .padding(.top, 10)
            
            // MARK: - Profile Row
            HStack(spacing: 12) {
                
                ProfileImageView(imageName: "Profile")
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .scaleEffect(imageScale)
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    Text("LA SEAVYONG")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Member since '21")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(
                            .white.opacity(0.7)
                        )
                }
                .scaleEffect(textScale)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .offset(y: profileY)
            .opacity(fadeOpacity)
        }
        .frame(height: headerHeight)
        .clipped()
        .animation(
            .easeInOut(duration: 0.22),
            value: progress
        )
    }
}
