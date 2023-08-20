//
//  RouletteAppTabViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 19.08.2023.
//

import SwiftUI

class RouletteAppTabViewModel: ObservableObject {
    
    @Published var isIncreasing: Bool = false
    @Published var hideTabBar = false
    
    @Published var rouletteAppTabModel: RouletteAppTabModel = .game {
        didSet {
            isIncreasing = false
        }
    }
    @Published var arayRouletteAppTabModel: [RouletteAppTabModel] = RouletteAppTabModel.allCases

    let trackableScrollMenager = TrackableScrollMenager.shared

    init() {
        trackableScrollMenager.$isIncreasing
            .map({ $0 })
            .assign(to: &$isIncreasing)
    }
    
    func selectTab(_ tab: RouletteAppTabModel) {
        withAnimation {
            rouletteAppTabModel = tab
        }
    }
    
    
}
