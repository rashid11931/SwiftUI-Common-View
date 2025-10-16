//
//  PrimaryStyle.swift
//  ViewModifier
//
//  Created by MD RASHID IQUBAL on 16/10/25.
//

import Foundation
import SwiftUI

/**
 
 You can create a reusable ViewModifier in SwiftUI to style Text or Button views with consistent appearance. Here’s a simple example that applies padding, background color, corner radius, and font styling:

 ✅ Custom ViewModifier
 */

struct PrimaryStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.gray)
            .foregroundStyle(.green)
            .font(.headline)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}



/**
✅ Extension for Easier Usage
 */

extension View {
    
    func primaryStyle() -> some View {
        self.modifier(PrimaryStyle())
    }
}

/**
 
 🛠️ Customization Tips
 You can parameterize the modifier for flexibility:
 */

struct CustomStyle: ViewModifier {
    var bgColor: Color
    var textColor: Color
    var font: Font
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(bgColor)
            .foregroundStyle(textColor)
            .font(font)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}



