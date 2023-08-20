//
//  TrackableScrollMenager.swift
//  RouletteApp
//
//  Created by Igor Kononov on 19.08.2023.
//

import Foundation

class TrackableScrollMenager: ObservableObject {
    static let shared = TrackableScrollMenager()
    
    @Published var isIncreasing: Bool = false
}
