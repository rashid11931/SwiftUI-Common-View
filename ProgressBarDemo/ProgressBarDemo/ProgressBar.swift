//
//  ProgressBar.swift
//  ProgressBarDemo
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI
/**
 🧠 Why Use `GeometryReader` Here?
 •  It gives access to the parent container’s width.
 •  You can scale the progress bar dynamically: width = containerWidth × progress.
 
 🎨 Customization Ideas
 1. Add gradient fills or animation:
 .fill(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
 
 2. Add percentage text overlay:
 .overlay {
 Text("\(Int(progress) * 100)%")
 .foregroundStyle(.white)
 .bold()
 .padding(.leading, 6)
 }
 
 */
struct ProgressBar: View {
    var progress: CGFloat // value between 0.0 and 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 20)
                
                // Foreground progress
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geometry.size.width * progress, height: 20)
                        .animation(.easeInOut(duration: 0.3), value: progress)
                    
                    Text("\(Int(progress * 100))%")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: geometry.size.width, height: 20)
                }
            }
        }
        .frame(height: 20) // constraint height
        .padding(.horizontal)
    }
}

#Preview {
    ProgressBar(progress: 0.5)
}
