//
//  ContentView.swift
//  AdaptiveGridView
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI

/**
 To build an adaptive grid layout using GeometryReader in SwiftUI, you can dynamically calculate the number of columns based on the available width. This gives you full control over how many items fit per row, making the layout responsive across devices
 
 🧠 How It Works
 •  GeometryReader gives you the container width.
 •  You divide that width by a minimum item width to calculate how many columns fit.
 •  LazyVGrid uses that dynamic column count to lay out items.
 
 🎨 Customization Ideas
 •  Add animations when resizing.
 •  Use .frame(minWidth: itemMinWidth) for tighter control.
 •  Add accessibility labels to each item.
 
 */

// 🧱 Example: Adaptive Grid with GeometryReader
struct ContentView: View {
    let items = Array(1...50)
    let itemMinWidth: CGFloat = 120
    var body: some View {
        
        GeometryReader { geometry in
            let totalWidth = geometry.size.width
            let columns = max(Int(totalWidth / itemMinWidth), 1)
          //  Text("totalWidth: \(totalWidth), columns: \(columns)")
            let gridItems = Array(repeating: GridItem(.flexible()), count: columns)
           // Text("totalWidth: \(totalWidth), columns: \(columns), GridItem: \(gridItems)")
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16){
                    ForEach(items, id: \.self) { item in
                        Text("Item \(item)")
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .background(.blue.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
