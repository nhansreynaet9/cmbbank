import SwiftUI

struct BankingServicesView: View {

    let services: [ServiceModel]
    var onTap: ((ServiceModel) -> Void)? = nil

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
                    Button {
                        onTap?(service)
                    } label: {
                        ServiceItemView(service: service)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 204)
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .frame(maxWidth: .infinity)
    }
}
