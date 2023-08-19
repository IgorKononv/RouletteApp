//
//  InfoBoardMenager.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

class InfoBoardMenager: ObservableObject{
    static let shared = InfoBoardMenager()
    
    @Published var rate = 50
    @Published var moneyBalance = 2000
    @Published var isAnimating = false {
        didSet {
            didWinByNumbers()
        }
    }
    @Published var currentSector: SectorModel = SectorModel(number: 0, color: .green, whichOfTwelveModel: nil, whichOfHalfModel: nil, whicOfEvenModel: nil, whichOfTwoInOne: nil)
    
    //Bets
    @Published var dictionarySectorsWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfTwelveWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfTwoInOneWinBets = [SectorModel: Int]()
    
    @Published var dictionaryWhichHalfOfDigitsWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfColorWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfEvenWinBets = [SectorModel: Int]()
    
    func changeRate(rate: Int) {
        self.rate = rate
    }
    
    private func didWinByNumbers() {
        if !isAnimating {
            if let value = dictionarySectorsWinBets[currentSector] {
                moneyBalance += value * 36
            }
            if let value = dictionaryWhichOfTwelveWinBets[currentSector] {
                moneyBalance += value * 3
            }
            if let value = dictionaryWhichOfTwoInOneWinBets[currentSector] {
                moneyBalance += value * 3
            }
            
            if let value = dictionaryWhichHalfOfDigitsWinBets[currentSector] {
                moneyBalance += value * 2
            }
            if let value = dictionaryWhichOfColorWinBets[currentSector] {
                moneyBalance += value * 2
            }
            if let value = dictionaryWhichOfEvenWinBets[currentSector] {
                moneyBalance += value * 2
            }

            dictionarySectorsWinBets = [:]
            dictionaryWhichOfTwelveWinBets = [:]
            dictionaryWhichOfTwoInOneWinBets = [:]
            
            dictionaryWhichHalfOfDigitsWinBets = [:]
            dictionaryWhichOfColorWinBets = [:]
            dictionaryWhichOfEvenWinBets = [:]

        }
    }
}
