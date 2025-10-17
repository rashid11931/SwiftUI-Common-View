//
//  ContentView.swift
//  PreferenceKey
//
//  Created by MD RASHID IQUBAL on 18/10/25.
//

import SwiftUI

/**
 🧠 Summary
 Role       - Code                     -  Purpose
 -----------------------------------------------------------
 Define key - SizePreferenceKey       -  Describes the data being passed
 
 Emit value - preference(key:value:)  - Sends size from child to parent
 
 Emit value - .onPreferenceChange(_ key:)- Parent listens and updates state
 
 This is the foundation for sticky headers, scroll tracking, dynamic layout adjustments — anything where a parent needs to react to a child’s geometry.
 */
struct ContentView: View {
    
    @State private var textSize: CGSize = .zero

    var body: some View {
        VStack {
            
            Text("Measured size: \(Int(textSize.width)) × \(Int(textSize.height))")
            
            Text("Hello")
                .background(
                    GeometryReader { geometry in
                        // emits GeometryView size
                        Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
                    }
                )
        }
        .onPreferenceChange(SizePreferenceKey.self) { newSize in
            textSize = newSize
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
