//
//  NamedFrameExample.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI

/**
 🧠 What’s Happening
 •  .coordinateSpace(name: "CustomSpace") defines a named coordinate space.
 •  Inside GeometryReader, geometry.frame(in: .named("CustomSpace")) gives you the view’s frame relative to that space.
 •  You can now track origin, size, or alignment in a layout-aware way
 
 🔍 Use Cases
 •  Aligning views across nested containers
 •  Tracking scroll offset or animation triggers
 •  Building layout inspectors or debug overlays

 Want to combine this with PreferenceKey or track multiple views in the same space? I can show you how to build a layout map next.
 
 
 
 ✅ What It Actually Does
 •  The .coordinateSpace(name:) modifier registers a named coordinate space in the SwiftUI view hierarchy.
 •  You can then use that name with geometry.frame(in: .named("CustomSpace")) to measure a view’s position relative to that space
 
 🧠 Behind the Scenes
 •  "CustomSpace" is just a String identifier — no need to define a struct, enum, or type.
 •  SwiftUI internally maps that name to a coordinate space context.
 •  You can use any unique string as the name.
 
 🧭 Tip
 If you ever want to measure a child view’s position relative to a grandparent or root, named coordinate spaces give you that flexibility — no extra types required
 */
struct NamedFrameExample: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let frame = geometry.frame(in: .named("CustomSpace"))
                VStack {
                    Text("It is custom space:")
                    Text("x: \(Int(frame.origin.x)), y: \(Int(frame.origin.y))")
                        .padding()
                }
                .background(Color.blue.opacity(0.2))
            }
            .frame(height: 100)
        }
        .coordinateSpace(name: "CustomSpace") // 👈 Define the named space here
    }
}

#Preview {
    NamedFrameExample()
}
