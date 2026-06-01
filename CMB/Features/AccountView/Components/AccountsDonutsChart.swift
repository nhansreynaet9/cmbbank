import SwiftUI

struct AccountsDonutChart: View {

    let count: Int

    private let segments: [(from: Double, to: Double, color: Color)] = [
        (0.00, 0.33, Color.donutGreen),
        (0.38, 0.69, Color.donutDarkGreen),
        (0.74, 0.95, Color.donutBlue),
    ]

    private let lineWidth: CGFloat = 12
    var body: some View {
        ZStack {
            backgroundCircle
            trackCircle
            segmentArcs
            centerLabel
        }
    }
    private var backgroundCircle: some View {
        Circle()
            .fill(Color.white)
            .padding(-12)
        
    }
    private var trackCircle: some View {
        Circle()
            .stroke(Color.white, lineWidth: lineWidth)
    }
    private var segmentArcs: some View {
        ForEach(segments.indices, id: \.self) { i in
            Circle()
                .trim(from: segments[i].from, to: segments[i].to)
                .stroke(
                    segments[i].color,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
        }
    }
    private var centerLabel: some View {
        VStack(spacing: 2) {
            Text("\(count)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black.opacity(0.85))
            Text("Accounts")
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
    }
}

