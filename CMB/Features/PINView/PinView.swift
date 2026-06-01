import SwiftUI

struct PinView: View {
    var onBack: (() -> Void)? = nil
    var onHelp: (() -> Void)? = nil

    @StateObject private var viewModel = PinViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            AppBackground()
        
            HStack {
                Button(action: { onBack?() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: { onHelp?() }) {
                    Text("Help?")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            VStack(spacing: 0) {
                Spacer().frame(height: 60)
                VStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.brandPrimary)
                            .frame(width: 64, height: 64)
                        Image(systemName: "lock.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 40)

              
                    Text("Enter 6-digit PIN")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)
                        .padding(.top, 16)

               
                    PinDotsView(
                        count: viewModel.digits.count,
                        total: viewModel.pinLength,
                        isError: viewModel.isError
                    )
                    .padding(.top, 24)
                    .modifier(ShakeEffect(trigger: viewModel.isError))

                  
                    Button(action: viewModel.forgotPin) {
                        Text("Forgot your PIN?")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color.brandPrimary)
                    }
                    .padding(.top, 32)

                    Spacer()

            
                    PinKeypadView(
                        onTap: viewModel.tap,
                        onDelete: viewModel.delete
                    )
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.systemBackground))
                .clipShape(AppRoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                .ignoresSafeArea(edges: .bottom)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

struct ShakeEffect: GeometryEffect {
    var trigger: Bool
    var animatableData: CGFloat = 0

    init(trigger: Bool) {
        self.trigger = trigger
        self.animatableData = trigger ? 1 : 0
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let offset = sin(animatableData * .pi * 4) * 8
        return ProjectionTransform(CGAffineTransform(translationX: offset, y: 0))
    }
}

#Preview {
    PinView()
}
