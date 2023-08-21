//
//  SectorMeneger.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import Foundation

class SectorMeneger {
    static let shared = SectorMeneger()
    
    let sectors: [SectorModel] = [
        SectorModel(number: 32, color: .red, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .middle),
        SectorModel(number: 15, color: .black, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .top),
        SectorModel(number: 19, color: .red, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .bottom),
        SectorModel(number: 4, color: .black, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .bottom),
        SectorModel(number: 21, color: .red, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .top),
        SectorModel(number: 2, color: .black, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .middle),
        SectorModel(number: 25, color: .red, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .bottom),
        SectorModel(number: 17, color: .black, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .middle),
        SectorModel(number: 34, color: .red, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .bottom),
        SectorModel(number: 6, color: .black, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .top),
        SectorModel(number: 27, color: .red, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .top),
        SectorModel(number: 13, color: .black, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .bottom),
        SectorModel(number: 36, color: .red, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .top),
        SectorModel(number: 11, color: .black, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .middle),
        SectorModel(number: 30, color: .red, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .top),
        SectorModel(number: 8, color: .black, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .middle),
        SectorModel(number: 23, color: .red, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .middle),
        SectorModel(number: 10, color: .black, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .bottom),
        SectorModel(number: 5, color: .red, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .middle),
        SectorModel(number: 24, color: .black, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .top),
        SectorModel(number: 16, color: .red, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .bottom),
        SectorModel(number: 33, color: .black, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .top),
        SectorModel(number: 1, color: .red, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .bottom),
        SectorModel(number: 20, color: .black, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .middle),
        SectorModel(number: 14, color: .red, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .middle),
        SectorModel(number: 31, color: .black, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .bottom),
        SectorModel(number: 9, color: .red, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .top),
        SectorModel(number: 22, color: .black, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .bottom),
        SectorModel(number: 18, color: .red, whichOfTwelveModel: .secondTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .top),
        SectorModel(number: 29, color: .black, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .middle),
        SectorModel(number: 7, color: .red, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .bottom),
        SectorModel(number: 28, color: .black, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .bottom),
        SectorModel(number: 12, color: .red, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .even, whichOfTwoInOne: .top),
        SectorModel(number: 35, color: .black, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .middle),
        SectorModel(number: 3, color: .red, whichOfTwelveModel: .firstTwelve, whichOfHalfModel: .firstHalf, whicOfEvenModel: .odd, whichOfTwoInOne: .top),
        SectorModel(number: 26, color: .black, whichOfTwelveModel: .thirdTwelve, whichOfHalfModel: .secondHalf, whicOfEvenModel: .even, whichOfTwoInOne: .middle),
        SectorModel(number: 0, color: .green, whichOfTwelveModel: nil, whichOfHalfModel: nil, whicOfEvenModel: nil, whichOfTwoInOne: nil)
    ]
}
