//
//  RouleteTabViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

class RouleteTabViewModel: ObservableObject {
    
    @Published var scrollViewContentOffset: CGFloat = 0.0
    @Published var didShowMore = false
//    @Published var moneyBalance = 2000
    @Published var currentUser: UserModel = UserModel(id: "", email: nil, userName: "", moneyBalance: 0, winGames: 0, payedGames: 0)
    @Published var rate = 50 {
        didSet  {
            infoBoardMenager.changeRate(rate: rate)
        }
    }
    
    @Published var isAnimating = false
    @Published var currentSector: SectorModel = SectorModel(number: 0, color: .green, whichOfTwelveModel: nil, whichOfHalfModel: nil, whicOfEvenModel: nil, whichOfTwoInOne: nil)
    
    let infoBoardMenager = InfoBoardMenager.shared
    let trackableScrollMenager = TrackableScrollMenager.shared
    
    let valuesBet: [Int] = [50, 100, 200, 500, 1000, 2000]
    
    init() {
        infoBoardMenager.$currentSector
            .map({ $0 })
            .assign(to: &$currentSector)
        infoBoardMenager.$isAnimating
            .map({ $0 })
            .assign(to: &$isAnimating)
        infoBoardMenager.$currentUser
            .map { $0 }
            .assign(to: &$currentUser)
    }
    
    func changeRate(isPlus: Bool) {
        if isPlus {
            rate += 1
        } else {
            if currentUser.moneyBalance > 0 {
                rate -= 1
            }
        }
    }
    
    func showMore() {
        withAnimation {
            didShowMore.toggle()
        }
    }
    
    func checkScroll() {
        if scrollViewContentOffset > 50 {
            trackableScrollMenager.isIncreasing = true
        } else {
            trackableScrollMenager.isIncreasing = false
        }
    }
}
