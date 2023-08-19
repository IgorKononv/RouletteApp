//
//  WhichOfTwelveModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import Foundation

enum WhichOfTwelveModel: Identifiable, CaseIterable {
    case firstTwelve
    case secondTwelve
    case thirdTwelve
    
    var id: UUID {
        switch self {
        case .firstTwelve:
            return UUID()
        case .secondTwelve:
            return UUID()
        case .thirdTwelve:
            return UUID()
        }
    }
    
    var name: String {
        switch self {
        case .firstTwelve:
            return "1 st 12"
        case .secondTwelve:
            return "2 st 12"
        case .thirdTwelve:
            return "3 st 12"
        }
    }
}


enum WhichOfHalfModel {
    case firstHalf
    case secondHalf
}

enum WhicOfEvenModel {
    case even
    case odd
}

enum WhichOfTwoInOne: CaseIterable {
    case bottom
    case middle
    case top
    
}
