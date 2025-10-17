//
//  HorizontalProgressBar.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//
import SwiftUI

struct HorizontalProgressBar: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 20)

                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: geometry.size.width * progress, height: 20)
                    .shadow(color: .purple.opacity(0.5), radius: 6, x: 0, y: 0)

                Text("\(Int(progress * 100))%")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: geometry.size.width, height: 20)
            }
        }
        .frame(height: 20)
    }
}

#Preview {
    HorizontalProgressBar(progress: 0.3)
}
