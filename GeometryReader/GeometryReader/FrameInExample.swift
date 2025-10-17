//
//  FrameInExample.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI
/**
 🧭 Getting Position with `frame(in:)
 GeometryReader { geometry in
     let frame = geometry.frame(in: .global) // or .local, .named("CustomSpace")

     Text("Origin: x=\(Int(frame.origin.x)), y=\(Int(frame.origin.y))")
         .position(x: frame.midX, y: frame.midY)
 }
 
 🔍 Coordinate Spaces
 •  .global: relative to the entire screen
 •  .local: relative to the parent view
 •  .named("CustomSpace"): custom coordinate space using .coordinateSpace(name:)
 */
struct FrameInExample: View {
    
    var body: some View {
        
        VStack {
            Text("Frame Example")
            
            GeometryReader { geometry in
                let frame = geometry.frame(in: .global)

                VStack(alignment: .leading) {
                    Text("Size: \(Int(geometry.size.width)) x \(Int(geometry.size.height))")
                    Text("Frame Size: \(Int(frame.size.width)) x \(Int(frame.size.height))")
                    
                    Text("Origin: x = \(Int(frame.origin.x)), y = \(Int(frame.origin.y))")
                }
            }
        }
        .padding()
        .background(.gray)
        
    }
}

#Preview {
    FrameInExample()
}
