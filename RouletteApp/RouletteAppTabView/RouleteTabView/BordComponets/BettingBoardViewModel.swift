//
//  BettingBoardViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

class BettingBoardViewModel: ObservableObject {
    let sectors: [SectorModel] = SectorMeneger.shared.sectors.sorted(by: {$0.number < $1.number})
    let whichOfTwelve: [WhichOfTwelveModel] = WhichOfTwelveModel.allCases
    let whichOfTwoInOne: [WhichOfTwoInOne] = WhichOfTwoInOne.allCases
}
