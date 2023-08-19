//
//  SectorModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import Foundation

struct SectorModel: Equatable, Hashable {    
    let number: Int
    let color: SectorColor
    let whichOfTwelveModel: WhichOfTwelveModel?
    let whichOfHalfModel: WhichOfHalfModel?
    let whicOfEvenModel: WhicOfEvenModel?
    let whichOfTwoInOne: WhichOfTwoInOne?
}
