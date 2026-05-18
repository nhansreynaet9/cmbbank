import SwiftUI



struct FrequentlyUsedSection: View {

    let items: [FrequentItem] = [
        .init(image: "img_elect"),
        .init(image: "ic_d"),
        .init(image: "ic_logo1"),
        .init(image: "ic_tm")
    ]

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Frequently Used")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 15) {

                    ForEach(items) { item in

                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 64, height: 64)
                            .overlay(
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            )
                            .overlay(
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
