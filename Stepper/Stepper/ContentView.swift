//
//  ContentView.swift
//  Stepper
//
//  Created by MD RASHID IQUBAL on 16/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var oldValue: Int = 0
    @State private var newValue: Int = 0
    
    @State private var quantity: Int = 0
    var body: some View {
        VStack {
            
            StepperView(oldVal: $oldValue, newVal: $newValue)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
