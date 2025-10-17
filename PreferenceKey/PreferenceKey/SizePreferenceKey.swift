//
//  SizePreferenceKey.swift
//  PreferenceKey
//
//  Created by MD RASHID IQUBAL on 18/10/25.
//

import SwiftUI

/**
 🧱 Goal Implementation PreferenceKey

 We want to:

 •  Measure the size of a Text("Hello") view
 •  Pass that size to the parent using PreferenceKey
 •  Display the size in the parent view
 
 ✅ Step 1: Define the PreferenceKey
 
 struct SizePreferenceKey: PreferenceKey {
     static var defaultValue: CGSize = .zero

     static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
         value = nextValue() // use the latest value
     }
 }
 
 ✅ Step 2: Emit the Size from the Child
 
 Text("Hello")
     .background(
         GeometryReader { geo in
             Color.clear
                 .preference(key: SizePreferenceKey.self, value: geo.size)
         }
     )
 
 
 ✅ Step 3: Receive the Size in the Parent
 
 struct ParentView: View {
     @State private var textSize: CGSize = .zero

     var body: some View {
         VStack(spacing: 20) {
             Text("Measured size: \(Int(textSize.width)) × \(Int(textSize.height))")

             Text("Hello")
                 .background(
                     GeometryReader { geo in
                         Color.clear
                             .preference(key: SizePreferenceKey.self, value: geo.size)
                     }
                 )
         }
         .onPreferenceChange(SizePreferenceKey.self) { newSize in
             textSize = newSize
         }
         .padding()
     }
 }
 
 
 */
struct SizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

// PreferenceKey
/**
  PreferenceKey is one of SwiftUI’s most powerful layout tools, especially for passing view data up the hierarchy. Let’s break it down step-by-step with analogies and examples
  
  🧠 Mental Model: “Upstream Communication”

  Imagine SwiftUI views as a river flowing downstream — data usually flows from parent to child. But what if a child view wants to send data upstream to its parent? That’s where PreferenceKey comes in
  
  It’s like a message-in-a-bottle: the child drops a value into the stream, and the parent catches it later.
  
  🧱 Step-by-Step Breakdown

  1. Define a PreferenceKey
  
  struct MySizePreferenceKey: PreferenceKey {
      static var defaultValue: CGSize = .zero

      static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
          value = nextValue()
      }
  }
  
  •  defaultValue: fallback if no child sets a value
  •  reduce: combines multiple values (e.g., max, min, latest)
  
  2. Attach a Preference in a Child View
  
  Text("Hello")
      .background(
          GeometryReader { geometry in
              Color.clear
                  .preference(key: MySizePreferenceKey.self, value: geometry.size)
          }
      )
  
  •  The child uses .preference(key:value:) to send its size upstream meanig towards parent
  
  3. Read the Preference in a Parent View
  struct ParentView: View {
      @State private var childSize: CGSize = .zero

      var body: some View {
          VStack {
              Text("Child size: \(Int(childSize.width)) × \(Int(childSize.height))")

              Text("Hello")
                  .background(
                      GeometryReader { geometry in
                          Color.clear
                              .preference(key: MySizePreferenceKey.self, value: geometry.size)
                      }
                  )
          }
          .onPreferenceChange(MySizePreferenceKey.self) { newSize in
              childSize = newSize
          }
      }
  }
  •  .onPreferenceChange lets the parent react to the child’s value.
  
  🧪 Real Use Cases

  •  Track child view size or position
  •  Build sticky headers or scroll-aware effects
  •  Share layout info across views without direct bindings
  
  🧭 Analogy Recap

  •  Child view: drops a value into the stream
  •  PreferenceKey: defines how values are collected
  •  Parent view: listens and reacts to the stream
  
  Brilliant question, Md — and you're catching a subtle but important distinction. Here's the clear breakdown:

  ---

  ## 🧠 What Kind of Data Does `PreferenceKey` Pass?

  ### ✅ Primarily: **Layout-Related Data**
  This is the most common and powerful use case:

  - **Size** (`CGSize`)
  - **Position / Frame** (`CGRect`)
  - **Bounds / Anchors** (`Anchor<CGRect>`)
  - **Scroll offset**
  - **Visibility / geometry triggers**

  These are emitted by child views using `.preference(key:value:)`, often wrapped in a `GeometryReader`, and consumed by parents via `.onPreferenceChange`.

  ---

  ### 🧪 Example: Passing Size Upstream

  ```swift
  Text("Hello")
      .background(
          GeometryReader { geo in
              Color.clear.preference(key: SizeKey.self, value: geo.size)
          }
      )
  ```

  ---

  ### 🧠 But Technically: **Any Data Type Can Be Passed**
  You can use `PreferenceKey` to pass **non-layout data** too — like strings, enums, or custom structs — as long as:

  - The child emits it via `.preference(key:value:)`
  - The parent listens via `.onPreferenceChange`

  This is less common, but useful for things like:

  - **Custom tab selection**
  - **Child view state reporting**
  - **Dynamic configuration**

  ---

  ### ✅ Summary

  | Type of Data        | Common? | Example Use Case                      |
  |---------------------|--------|---------------------------------------|
  | Layout (size, frame)| ✅ Yes | Sticky headers, scroll tracking       |
  | Anchors             | ✅ Yes | Bounds, alignment, positioning        |
  | Custom values       | ⚠️ Less | Tab selection, child state reporting  |
  | Strings, Ints       | ⚠️ Rare | Dynamic labels, identifiers           |

  ---

  So when I say “PreferenceKey passes data upstream,” I usually mean **layout data**, because that’s where it shines. But it’s flexible enough to carry **any value** — it’s just that layout is the most natural and powerful use case in SwiftUI’s declarative tree.

  Want to build a demo that passes both layout and custom state using two PreferenceKeys? We can wire it up and visualize the flow.
*/
