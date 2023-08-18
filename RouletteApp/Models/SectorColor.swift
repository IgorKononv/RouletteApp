//
//  SectorColor.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import Foundation

enum SectorColor: String {
    case red = "RED"
    case black = "BLACK"
    case green = "ZERO"
    case empty
    
    var color: String {
        switch self {
            
        case .red:
            return "Red"
        case .black:
            return "Black"
        case .green:
            return "Green"
        case .empty:
            return ""
        }
    }
}
