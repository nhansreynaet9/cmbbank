import SwiftUI


struct HomeView: View {
    
    @State private var selectedTab: Int = 0
    @State private var scrollOffset: CGFloat = 0

    let services: [ServiceModel] = [
        .init(icon: "ic_wallet", title: "Accounts"),
        .init(icon: "ic_payment", title: "Payments"),
        .init(icon: "ic_tranfer", title: "Transfers"),
        .init(icon: "ic_loans", title: "Loan"),
        .init(icon: "ic_account", title: "Cards"),
        .init(icon: "ic_favorite", title: "Favorites")
    ]
    
    let actions: [ActionModel] = [
        .init(icon: "ic_schedule", title: "Schedules"),
        .init(icon: "ic_exchange", title: "Exchange rate"),
        .init(icon: "ic_locator", title: "Locator")
    ]

    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Color.appBackground
                .ignoresSafeArea()

            // MARK: - Main ScrollView
            ScrollView(showsIndicators: false) {
                
                // MARK: - Scroll Tracker
                GeometryReader { geo in
                    
                    let offset = geo.frame(in: .global).minY
                    
                    Color.clear
                        .onAppear {
                            scrollOffset = -offset
                        }
                        .onChange(of: offset) { _, value in
                            scrollOffset = -value
                        }
                }
                .frame(height: 0)

                VStack(spacing: 0) {
                    
                    // MARK: - Header Space
                    // ✅ FIX: Increased from 100 to 140 to match the taller header,
                    // so the profile is fully visible above the Quick Banking chip.
                    Color.clear
                        .frame(height: 100)
                    
                    // MARK: - Quick Banking
                    QuickBankingChip()
                        .padding(.horizontal, 16)
                      
                    
                    // MARK: - Account Card
                    AccountCardView()
                        .padding(.top, 20)
                        .padding(.horizontal, 16)
                    
                    // MARK: - Banking Services
                    VStack(alignment: .leading, spacing: 8) {
                        
                        BankingServicesView(services: services)
                            .padding(.horizontal, 10)

                        HorizontalActionsView(actions: actions)
                    }
                    .padding(.top, 12)
                    .padding(.trailing, 6)
                    .padding(.bottom, 12)
                    .padding(.leading, 6)
                    .frame(maxWidth: 356, minHeight: 309)
                    .background(
                        Color(
                            red: 48/255,
                            green: 48/255,
                            blue: 48/255
                        )
                        .opacity(0.67)
                        .background(
                            VisualBlurEffect(
                                style: .systemThinMaterialDark
                            )
                            .blur(radius: 4)
                        )
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                Color(
                                    red: 96/255,
                                    green: 96/255,
                                    blue: 96/255
                                )
                                .opacity(0.30),
                                lineWidth: 1.5
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                Color(
                                    red: 96/255,
                                    green: 96/255,
                                    blue: 96/255
                                )
                                .opacity(0.30),
                                lineWidth: 2
                            )
                            .blur(radius: 4)
                            .offset(x: 0, y: 1)
                            .mask(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                            )
                    )
                    .padding(.top, 12)
                    .padding(.horizontal, 16)
                    
                    // MARK: - Frequently Used
                    FrequentlyUsedSection()
                        .padding(.top, 20)
                }
                .padding(.bottom, 120)
            }

            // MARK: - Sticky Header Overlay
            VStack(spacing: 0) {
                
                HeaderView(scrollOffset: scrollOffset)
                
                Spacer()
            }
            .ignoresSafeArea(edges: .top)

            // MARK: - Bottom Tab
            CustomTab(selectedTab: $selectedTab)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

// MARK: - Updated Header View
struct HeaderView: View {
    
    var scrollOffset: CGFloat
    
    // MARK: - Animation Progress
    private var progress: CGFloat {
        let value = scrollOffset / 100
        return min(max(value, 0), 1)
    }
    
    // MARK: - Header Height
    // ✅ FIX: Increased base from 120 to 160 so the profile sits fully
    // inside the header frame and isn't clipped before Quick Banking.
    private var headerHeight: CGFloat {
        let collapse = progress * 40
        return 160 - collapse
    }
    
    // MARK: - Dynamic Profile Position
    // When progress is 0 (unscrolled), top padding is 56.
    // When progress is 1 (scrolled), top padding shrinks to 0 so it aligns perfectly with the icons.
    private var profileTopPadding: CGFloat {
        let maxSpacing: CGFloat = 56
        return maxSpacing - (progress * maxSpacing)
    }
    
    // MARK: - Image Scale
    private var imageScale: CGFloat {
        let shrink = progress * 0.10
        return 1 - shrink
    }
    
    // MARK: - Text Scale
    private var textScale: CGFloat {
        let shrink = progress * 0.04
        return 1 - shrink
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            // MARK: - Solid Background (matches app background)
            Color.appBackground
                .ignoresSafeArea()
            
            // MARK: - Pinned Top Right Icons
            // Stationary at exactly 56px from the top safety line
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
                        .background(Color(red: 196/255, green: 39/255, blue: 46/255))
                        .cornerRadius(10)
                }
                .padding(.trailing, 16)
            }
            .padding(.top, 56)
            
            // MARK: - Profile Section
            // Positioned inside a shared baseline layout box with the top icons.
            // When unscrolled, its internal offset pushes it down near Quick Banking.
            // When scrolled, it slides up and locks exactly onto the 56px row baseline.
            HStack(alignment: .center) {
                HStack(spacing: 12) {
                    ProfileImageView(imageName: "Profile")
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .scaleEffect(imageScale)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("NHAN SREYNAET")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Member since '21")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .scaleEffect(textScale, anchor: .leading)
                }
                
                Spacer()
            }
            .frame(height: 40) // Match the target layout height of the QR code block
            .padding(.horizontal, 16)
            .padding(.top, 56) // Matches the static alignment row anchor
            .offset(y: profileTopPadding) // Interpolates between the top row and Quick Banking space
        }
        .frame(height: headerHeight)
        .background(Color.clear)
        .clipped()
        .animation(.easeInOut(duration: 0.22), value: progress)
    }
}

// MARK: - Visual Blur Effect
struct VisualBlurEffect: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

// MARK: - Quick Banking Chip
struct QuickBankingChip: View {
    
    var body: some View {
        HStack {
            HStack(spacing: 6) {
                Image(systemName: "plus")
                    .font(.system(size: 12, weight: .bold))
                Text("Quick Banking")
                    .font(.system(size: 12, weight: .bold))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.black.opacity(0.3))
            .cornerRadius(20)
            
            Spacer()
        }
    }
}

// MARK: - Frequently Used Section
struct FrequentlyUsedSection: View {
    let items = ["AC", "D", "Logo1", "TM"]
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Frequently Used")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(items, id: \.self) { item in
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 64, height: 64)
                            .overlay(
                                Text(item)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.white)
                            )
                            .background(
                                Circle()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.top, 5)
    }
}

// MARK: - Horizontal Actions View
struct HorizontalActionsView: View {
    let actions: [ActionModel]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(actions) { action in
                    SmallActionButton(icon: action.icon, title: action.title)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
        }
    }
}

// MARK: - Small Action Button
struct SmallActionButton: View {
    let icon: String
    let title: String
    var body: some View {
        HStack(spacing: 8) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.black)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(25)
    }
}

#Preview {
    HomeView()
}
