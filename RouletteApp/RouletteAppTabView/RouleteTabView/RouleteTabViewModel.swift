//
//  RouleteTabViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

class RouleteTabViewModel: ObservableObject {
    
    @Published var didShowMore = false
    @Published var moneyBalance = 2000
    @Published var rate = 50 {
        didSet  {
            infoBoardMenager.changeRate(rate: rate)
        }
    }
    
    @Published var isAnimating = false
    @Published var currentSector: SectorModel = SectorModel(number: 0, color: .green, whichOfTwelveModel: nil, whichOfHalfModel: nil, whicOfEvenModel: nil, whichOfTwoInOne: nil)
    
    let infoBoardMenager = InfoBoardMenager.shared
    let valuesBet: [Int] = [50, 100, 200, 500, 1000, 2000, 10000]

    
    init() {
        infoBoardMenager.$currentSector
            .map({ $0 })
            .assign(to: &$currentSector)
        infoBoardMenager.$isAnimating
            .map({ $0 })
            .assign(to: &$isAnimating)
        infoBoardMenager.$moneyBalance
            .map({ $0 })
            .assign(to: &$moneyBalance)
    }
    
    func changeRate(isPlus: Bool) {
        if isPlus {
            rate += 1
        } else {
            rate -= 1
        }
    }
    
    func showMore() {
        withAnimation {
            didShowMore.toggle()
        }
    }
}
