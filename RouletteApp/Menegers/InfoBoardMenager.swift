//
//  InfoBoardMenager.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

class InfoBoardMenager: ObservableObject{
    static let shared = InfoBoardMenager()
    
    let authMeneger = FirebaseMeneger.shared
    
    @Published var currentUser: UserModel = UserModel(id: "", email: nil, userName: "", moneyBalance: 0, winGames: 0, payedGames: 0)
        
    @Published var rate = 50
//    @Published var moneyBalance = 2000
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
    
    init() {
        authMeneger.$currentUser
            .map { user in
                if let user = user {
                    return user
                } else {
                    return UserModel(id: "", email: nil, userName: "", moneyBalance: 0, winGames: 0, payedGames: 0)
                }
            }
            .assign(to: &$currentUser)
    }
    
    func changeRate(rate: Int) {
        self.rate = rate
    }
    
    private func didWinByNumbers() {
        var didWinGame = false
        
        if !isAnimating {
            if let value = dictionarySectorsWinBets[currentSector] {
                currentUser.moneyBalance += value * 36
                didWinGame = true
            }
            if let value = dictionaryWhichOfTwelveWinBets[currentSector] {
                currentUser.moneyBalance += value * 3
                didWinGame = true
            }
            if let value = dictionaryWhichOfTwoInOneWinBets[currentSector] {
                currentUser.moneyBalance += value * 3
                didWinGame = true
            }
            
            if let value = dictionaryWhichHalfOfDigitsWinBets[currentSector] {
                currentUser.moneyBalance += value * 2
                didWinGame = true
            }
            if let value = dictionaryWhichOfColorWinBets[currentSector] {
                currentUser.moneyBalance += value * 2
                didWinGame = true
            }
            if let value = dictionaryWhichOfEvenWinBets[currentSector] {
                currentUser.moneyBalance += value * 2
                didWinGame = true
            }
            if dictionarySectorsWinBets.isEmpty && dictionaryWhichOfTwelveWinBets.isEmpty && dictionaryWhichOfTwoInOneWinBets.isEmpty && dictionaryWhichHalfOfDigitsWinBets.isEmpty && dictionaryWhichOfColorWinBets.isEmpty && dictionaryWhichOfEvenWinBets.isEmpty {
                
            } else {
                if didWinGame {
                    currentUser.winGames += 1
                }
                currentUser.payedGames += 1
                authMeneger.changeBalanceAndWinRate(currentUser)
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
