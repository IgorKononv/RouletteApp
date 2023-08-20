//
//  RatingModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import Foundation

struct RatingModel: Identifiable {
    let id = UUID()
    let userName: String
    let userPoints: Int
}
