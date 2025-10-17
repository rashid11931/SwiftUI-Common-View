//
//  GeometryReaderLocal.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI

/**
 GeometryReader in SwiftUI is a powerful layout tool that lets you access the size and position of the container view it’s placed in. This enables dynamic, responsive layouts based on available space.
 
 🧠 What It Does

 •  It provides a GeometryProxy object that contains:
   ⁠◦  size: the width and height of the container
   ⁠◦  safeAreaInsets: insets for safe area
   ⁠◦  frame(in:): position and bounds in a given coordinate space
 
 🧱 Basic Syntax
 GeometryReader { geometry in
     Text("Width: \(geometry.size.width)")
         .frame(width: geometry.size.width / 2)
 }
 This example reads the parent’s width and sets the child view to half of it.
 
 📦 Use Cases

 •  Responsive layouts (e.g., adapting to screen size)
 •  Parallax scrolling effects
 •  Custom positioning or alignment
 •  Animations based on view position
 
 ⚠️ Gotchas

 •  GeometryReader takes all available space unless constrained
 •  It can disrupt layout if not wrapped carefully (e.g., inside ZStack, ScrollView, or with .frame)
 
 

 ## 🧠 What `GeometryReader` Actually Does

 - It wraps a view and exposes a `GeometryProxy` object.
 - This proxy contains layout info **as proposed by the parent** — not the final rendered size, but the size the parent offers.
 - You can read:
   - `geometry.size`: the proposed size for the child
   - `geometry.safeAreaInsets`: padding due to safe areas
   - `geometry.frame(in:)`: the view’s position and size in a given coordinate space

 ---

 ## 🧪 Example: Reading Size and Position

 ```swift
 GeometryReader { geometry in
     let size = geometry.size
     let frame = geometry.frame(in: .global)

     VStack {
         Text("Size: \(Int(size.width)) × \(Int(size.height))")
         Text("Origin: x=\(Int(frame.origin.x)), y=\(Int(frame.origin.y))")
     }
 }
 ```

 - `geometry.size` tells you how much space the parent gave this view.
 - `geometry.frame(in: .global)` tells you where this view is positioned on screen.

 ---

 ## 🧭 Key Insight

 > `GeometryReader` doesn’t measure the parent — it exposes what the parent **proposes** to the child.

 So if you wrap a `Text` in a `GeometryReader`, you’re not measuring the `Text` — you’re measuring the space **offered to it** by its parent.

 ---

 Would you like to build a layout inspector that shows live size and position of multiple views? We can wire it up with `PreferenceKey` and overlays.
 
 
 
 🧠 When to Use What
 Get Size                   :  geometry.size
 Get safe area insets       :  geometry.safeAreaInsets
 Get position/origin        :  geometry.frame(in:)
 Track bounds of a child    : geometry.bounds(of:)
 
 📐 GeometryProxy Recap

 Inside a GeometryReader, you get a GeometryProxy object named geometry. It provides:

 •  geometry.size: the proposed size of the container
 •  geometry.safeAreaInsets: safe area padding
 •  geometry.frame(in:): the position and size of the view in a given coordinate space
 •  geometry.bounds(of:): the bounds of a named view (requires .anchorPreference)
 */
struct GeometryReaderLocal: View {
    
    var body: some View {
        VStack {
            Text("Hello, GeometryReader!")
            
            GeometryReader{ geometry in
                let frame = geometry.frame(in: .local)
                VStack(alignment: .leading) {
                    Text("Content")
                        .frame(width: geometry.size.width, alignment: .leading)
                    
                    
                    Text("x = \(Int(frame.origin.x)), y =  \(Int(frame.origin.y))")
                }
            }
        }
        .padding()
        .background(.yellow.opacity(0.3))
    }
}

#Preview {
    GeometryReaderLocal()
}
