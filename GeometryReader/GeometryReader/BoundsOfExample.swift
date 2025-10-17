//
//  BoundsOfExample.swift
//  GeometryReader
//
//  Created by MD RASHID IQUBAL on 17/10/25.
//

import SwiftUI
/**
 🧲 Using `bounds(of:)` (Advanced)

 To use geometry.bounds(of:), you need to:

 1.  Attach an anchor preference to a view
 2.  Read it in a parent using GeometryReader
 
 
Note: Before doing this see the PreferenceKey Project
 */
struct BoundsOfExample: View {
    var body: some View {
        VStack {
            Text("Track me")
                .anchorPreference(key: BoundsKey.self, value: .bounds) { $0 }
        }
        .backgroundPreferenceValue(BoundsKey.self) { anchor in
            GeometryReader { geometry in
                let bounds = geometry[anchor!]
                Text("Bounds: \(bounds.debugDescription)")
            }
        }
    }
}

struct BoundsKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue()
    }
}

#Preview {
    BoundsOfExample()
}
