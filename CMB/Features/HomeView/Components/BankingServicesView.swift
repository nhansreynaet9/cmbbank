import SwiftUI

struct BankingServicesView: View {

    let services: [ServiceModel]

    let columns = Array(
        repeating: GridItem(.flexible()),
        count: 3
    )

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            Text("Banking Service")
                .font(.headline)
                .foregroundColor(.white)

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(services) { service in
                    ServiceItemView(service: service)
                }
            }
            .frame(maxWidth: 344, minHeight: 204) // Exact Figma Dimensions
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16)) // Exact Figma 16px Radius
        }
    }
}
