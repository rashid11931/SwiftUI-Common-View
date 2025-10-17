//
//  VerticalProgressBar.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI

struct VerticalProgressBar: View {
    @Binding var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40)

                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(colors: [.green, .yellow], startPoint: .bottom, endPoint: .top))
                    .frame(height: geometry.size.height * progress)
                    .frame(width: 40)
                    .animation(.easeInOut(duration: 0.3), value: progress)

                Text("\(Int(progress * 100))%")
                    .foregroundColor(.primary)
                    .background(Color(.systemBackground))
                    .bold()
                    .rotationEffect(.degrees(-90))
                    .offset(y: -geometry.size.height / 2 + 20)
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let newProgress = 1.0 - (value.location.y / geometry.size.height)
                        progress = min(max(newProgress, 0), 1)
                    }
            )
            .accessibilityElement()
            .accessibilityLabel("Vertical Progress")
            .accessibilityValue("\(Int(progress * 100)) percent")
            .accessibilityHint("Swipe up to increase progress, swipe down to decrease")
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    progress = min(progress + 0.05, 1)
                case .decrement:
                    progress = max(progress - 0.05, 0)
                default:
                    break
                }
            }
        }
        .frame(width: 40, height: 200)
    }
}

#Preview {
    VerticalProgressBar(progress: .constant(0.5))
}
