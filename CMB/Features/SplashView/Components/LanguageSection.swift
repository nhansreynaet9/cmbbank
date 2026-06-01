import SwiftUI


 
struct LanguageSelectionView: View {
    @Binding var isPresented: Bool
    @State private var selectedLanguage: CMBLanguage = .khmer
    @EnvironmentObject var navigator: AppNavigator
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
 
            VStack(alignment: .leading, spacing: 2) {
                Text("Welcome to")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.secondaryLabel))
 
                HStack(spacing: 0) {
                    Image("ic_chipmongtext2")
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 28)

            VStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.appGreen.opacity(0.15))
                        .frame(width: 90, height: 90)
 
                    Image("ic_languagechange")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                        .foregroundColor(Color.appGreen)
                }
 
                Text("CHOOSE YOUR LANGUAGE")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(.label))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 48)
 
        
            VStack(spacing: 14) {
                ForEach(CMBLanguage.allCases, id: \.self) { lang in
                    LanguageRow(
                        language: lang,
                        isSelected: selectedLanguage == lang
                    ) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedLanguage = lang
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isPresented = false
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
 
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(24, corners: [.topLeft, .topRight])
    }
}
