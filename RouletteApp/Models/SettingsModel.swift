//
//  SettingsModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

enum SettingsModel: Identifiable, CaseIterable {
    case rateApp
    case shareGame
    case logOut
    case delete

    var id: UUID {
        switch self {
            
        case .rateApp:
            return UUID()
        case .shareGame:
            return UUID()
        case .logOut:
            return UUID()
        case .delete:
            return UUID()
        }
    }
    var name: String {
        switch self {
            
        case .rateApp:
            return "RATE APP"
        case .shareGame:
            return "SHARE GAME"
        case .logOut:
            return "LOG OUT"
        case .delete:
        return "DELETE ACCOUNt"
        }
    }
}
