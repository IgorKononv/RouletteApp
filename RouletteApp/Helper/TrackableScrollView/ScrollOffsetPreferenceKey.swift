//
//  ScrollOffsetPreferenceKey.swift
//  Habit
//
//  Created by Igor Kononov on 19.08.2023.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
