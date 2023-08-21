//
//  PlasePrizeModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import Foundation

enum PlasePrizeModel {
    case first
    case second
    case third
    case topTen
    case elsePlases
    
    var image: String {
        switch self {
            
        case .first:
            return "first_icon"
        case .second:
            return "second_icon"
        case .third:
            return "third_icon"
        case .topTen:
            return "topTen_icon"
        case .elsePlases:
            return ""
        }
    }
}
