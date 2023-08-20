//
//  UserModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import Foundation

struct UserModel: Identifiable {
    let id: String
    let email: String?
    let userName: String
    var moneyBalance: Int
    var winGames: Int
    var payedGames: Int

}
