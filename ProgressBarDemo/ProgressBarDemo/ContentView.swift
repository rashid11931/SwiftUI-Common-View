//
//  ContentView.swift
//  ProgressBarDemo
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.5
    
    var body: some View {
        VStack {
          ProgressBar(progress: progress)
          Slider(value: $progress)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
