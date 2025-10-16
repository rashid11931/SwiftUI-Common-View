//
//  StepperView.swift
//  Stepper
//
//  Created by MD RASHID IQUBAL on 16/10/25.
//

import SwiftUI

struct StepperView: View {
    
    @Binding var oldVal: Int
    @Binding var newVal: Int
    
    @State private var quantity: Int = 0
    
    var body: some View {
       
        // Only TitleKey
        
        Text("Old, Stepper: \(oldVal)")
        Stepper("ADD ITEM", value: _oldVal, in: 0...27, step: 3, onEditingChanged: { changed in
            if changed {
                // changed is true when you touch-in the steppr
            } else {
               // changed is false when you touch-up the stepper
            }
        })
            .background(.gray)

        Text("New, Stepper: \(newVal)")
        
        // If you need Label(titleKey: image:)
        Stepper(value: $newVal, in: 0...9, step: 1) {
            Label("ADD OIL", systemImage: "eraser")
            
        } onEditingChanged: { isEditiging in
            print(isEditiging)
        }
        
        // Custom Stepper with Actions
        // This version gives you full control over the increment/decrement logic, useful for side effects or validation.
        Stepper {
            Label(
                title: { Text("STEPPER") },
                icon: { Image(systemName: "42.circle") }
)
        } onIncrement: {
            quantity += 1
        } onDecrement: {
            quantity -= 1
        } onEditingChanged: { isChanged in
            if isChanged {
                print("you have pressed the stepper")
            } else {
                print("you have spare the stepper")
            }
        }
        
        /**
         🎨 Styling Tips

         You can wrap the Stepper in a GroupBox, Form, or add modifiers like .background, .cornerRadius, or .frame to style it. Example:
         */

        GroupBox {
            Stepper("ADD ITEM", value: _oldVal, in: 0...27, step: 3)
        }
        .padding()
        .foregroundStyle(.green)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .stroke(.white, lineWidth: 2.0)
        }.shadow(radius: 10)
    }
}

#Preview {
    StepperView(oldVal: .constant(0), newVal: .constant(0))
}
