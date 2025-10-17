//
//  ContentView.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            GeometryReaderLocal()
            FrameInExample()
            
            
            BoundsOfExample()
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
