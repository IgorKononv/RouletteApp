//
//  RouletteAppTabModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 19.08.2023.
//

import Foundation

enum RouletteAppTabModel: CaseIterable {
    case game
    case rating
    case settings
    
    var image: String {
        switch self {
            
        case .game:
            return "game_icon"
        case .rating:
            return "rating_icon"
        case .settings:
            return "settings_icon"
        }
    }
    var name: String {
        switch self {
            
        case .game:
            return "Game"
        case .rating:
            return "Rating"
        case .settings:
            return "Settings"
        }
    }
}
