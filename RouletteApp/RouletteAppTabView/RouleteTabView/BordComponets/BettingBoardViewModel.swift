//
//  BettingBoardViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

class BettingBoardViewModel: ObservableObject {
    @Published var dictionarySectorsWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfTwelveWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfTwoInOneWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichHalfOfDigitsWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfColorWinBets = [SectorModel: Int]()
    @Published var dictionaryWhichOfEvenWinBets = [SectorModel: Int]()
    
    let sectors: [SectorModel] = SectorMeneger.shared.sectors.sorted(by: { $0.number < $1.number })
    let whichOfTwelve: [WhichOfTwelveModel] = WhichOfTwelveModel.allCases
    let whichOfTwoInOne: [WhichOfTwoInOne] = WhichOfTwoInOne.allCases
    let infoBoardMenager = InfoBoardMenager.shared
    
    init() {
        infoBoardMenager.$dictionarySectorsWinBets
            .map({ $0 })
            .assign(to: &$dictionarySectorsWinBets)
        infoBoardMenager.$dictionaryWhichOfTwelveWinBets
            .map({ $0 })
            .assign(to: &$dictionaryWhichOfTwelveWinBets)
        infoBoardMenager.$dictionaryWhichOfTwoInOneWinBets
            .map({ $0 })
            .assign(to: &$dictionaryWhichOfTwoInOneWinBets)
        infoBoardMenager.$dictionaryWhichHalfOfDigitsWinBets
            .map({ $0 })
            .assign(to: &$dictionaryWhichHalfOfDigitsWinBets)
        infoBoardMenager.$dictionaryWhichOfColorWinBets
            .map({ $0 })
            .assign(to: &$dictionaryWhichOfColorWinBets)
        infoBoardMenager.$dictionaryWhichOfEvenWinBets
            .map({ $0 })
            .assign(to: &$dictionaryWhichOfEvenWinBets)
    }
    
    func sectorsBetCell(_ sectorModel: SectorModel) {
        let rate = infoBoardMenager.rate
        
        if let retePlus = infoBoardMenager.dictionarySectorsWinBets[sectorModel] {
            infoBoardMenager.moneyBalance += retePlus
            infoBoardMenager.dictionarySectorsWinBets.removeValue(forKey: sectorModel)
        } else {
            infoBoardMenager.moneyBalance -= rate
            infoBoardMenager.dictionarySectorsWinBets[sectorModel] = rate
        }
    }
    
    func whichOfWhichOfTwelveBetCell(_ whichOfTwelve: WhichOfTwelveModel) {
        let rate = infoBoardMenager.rate
        var sectorModel: [SectorModel] = []
        
        sectors.forEach { sector in
            if sector.whichOfTwelveModel == whichOfTwelve {
                sectorModel.append(sector)
            }
        }
        var counter = true
        
        sectorModel.forEach { sector in
            if let retePlus = infoBoardMenager.dictionaryWhichOfTwelveWinBets[sector] {
                if counter {
                    infoBoardMenager.moneyBalance += retePlus
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfTwelveWinBets.removeValue(forKey: sector)
            } else {
                if counter {
                    infoBoardMenager.moneyBalance -= rate
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfTwelveWinBets[sector] = rate
            }
        }
    }
    
    func whichOfTwoInOneBetCell(_ whichOfTwoInOne: WhichOfTwoInOne) {
        let rate = infoBoardMenager.rate
        var sectorModel: [SectorModel] = []
        
        sectors.forEach { sector in
            if sector.whichOfTwoInOne == whichOfTwoInOne {
                sectorModel.append(sector)
            }
        }
        var counter = true
        
        sectorModel.forEach { sector in
            if let retePlus = infoBoardMenager.dictionaryWhichOfTwoInOneWinBets[sector] {
                if counter {
                    infoBoardMenager.moneyBalance += retePlus
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfTwoInOneWinBets.removeValue(forKey: sector)
            } else {
                if counter {
                    infoBoardMenager.moneyBalance -= rate
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfTwoInOneWinBets[sector] = rate
            }
        }
    }
    
    func bottomViewStackBetCell(bottomCell: Int) {
        let rate = infoBoardMenager.rate
        if bottomCell == 1 {
            
            var sectorModel: [SectorModel] = []
            
            sectors.forEach { sector in
                if sector.number != 0 && sector.number <= 18 {
                    sectorModel.append(sector)
                }
            }
            componentBottomWhichHalfOfDigitsWinBets(sectorModel: sectorModel, rate: rate)
            
        } else if bottomCell == 2 {
            var sectorModel: [SectorModel] = []
            
            sectors.forEach { sector in
                if sector.whicOfEvenModel == .even {
                    sectorModel.append(sector)
                }
            }
            componentBottomWhichOfEvenWinBets(sectorModel: sectorModel, rate: rate)
            
        } else if bottomCell == 3 {
            var sectorModel: [SectorModel] = []
            
            sectors.forEach { sector in
                if sector.color == .red {
                    sectorModel.append(sector)
                }
            }
            componentBottomWhichOfColorWinBets(sectorModel: sectorModel, rate: rate)
            
        } else if bottomCell == 4 {
            var sectorModel: [SectorModel] = []
            
            sectors.forEach { sector in
                if sector.color == .black {
                    sectorModel.append(sector)
                }
            }
            componentBottomWhichOfColorWinBets(sectorModel: sectorModel, rate: rate)
            
        } else if bottomCell == 5 {
            var sectorModel: [SectorModel] = []
            
            sectors.forEach { sector in
                if sector.whicOfEvenModel == .odd {
                    sectorModel.append(sector)
                }
            }
            componentBottomWhichOfEvenWinBets(sectorModel: sectorModel, rate: rate)
            
        } else {
            var sectorModel: [SectorModel] = []
            
            sectors.forEach { sector in
                if sector.number >= 19 {
                    sectorModel.append(sector)
                }
            }
            componentBottomWhichHalfOfDigitsWinBets(sectorModel: sectorModel, rate: rate)
        }
    }
    
    private func componentBottomWhichHalfOfDigitsWinBets(sectorModel: [SectorModel], rate: Int) {
        var counter = true
        sectorModel.forEach { sector in
            if let retePlus = infoBoardMenager.dictionaryWhichHalfOfDigitsWinBets[sector] {
                if counter {
                    infoBoardMenager.moneyBalance += retePlus
                    counter = false
                }
                infoBoardMenager.dictionaryWhichHalfOfDigitsWinBets.removeValue(forKey: sector)
            } else {
                if counter {
                    infoBoardMenager.moneyBalance -= rate
                    counter = false
                }
                infoBoardMenager.dictionaryWhichHalfOfDigitsWinBets[sector] = rate
            }
        }
    }
    
    private func componentBottomWhichOfEvenWinBets(sectorModel: [SectorModel], rate: Int) {
        var counter = true
        sectorModel.forEach { sector in
            if let retePlus = infoBoardMenager.dictionaryWhichOfEvenWinBets[sector] {
                if counter {
                    infoBoardMenager.moneyBalance += retePlus
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfEvenWinBets.removeValue(forKey: sector)
            } else {
                if counter {
                    infoBoardMenager.moneyBalance -= rate
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfEvenWinBets[sector] = rate
            }
        }
    }
    
    private func componentBottomWhichOfColorWinBets(sectorModel: [SectorModel], rate: Int) {
        var counter = true
        sectorModel.forEach { sector in
            if let retePlus = infoBoardMenager.dictionaryWhichOfColorWinBets[sector] {
                if counter {
                    infoBoardMenager.moneyBalance += retePlus
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfColorWinBets.removeValue(forKey: sector)
            } else {
                if counter {
                    infoBoardMenager.moneyBalance -= rate
                    counter = false
                }
                infoBoardMenager.dictionaryWhichOfColorWinBets[sector] = rate
            }
        }
    }
}
