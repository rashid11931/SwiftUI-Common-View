//
//  ContentView.swift
//  ViewModifier
//
//  Created by MD RASHID IQUBAL on 16/10/25.
//

import SwiftUI

struct ContentView: View {
    
    // ✅ Usage in SwiftUI View
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                
            
            Text("Hello, ViewModifier using modifier!")
                .modifier(PrimaryStyle())
            
            Text("Hello, ViewModifer!")
                .primaryStyle()
            
            Text("Hello, Custom ViewModifer")
                .modifier(CustomStyle(bgColor: .gray, textColor: .red, font: .largeTitle, cornerRadius: 25.0))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
