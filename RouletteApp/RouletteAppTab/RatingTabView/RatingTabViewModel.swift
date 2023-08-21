//
//  RatingTabViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI
import Combine

class RatingTabViewModel: ObservableObject {
    
    @Published var laderUsers: [UserModel] = []
    
    let firebaseMeneger = FirebaseMeneger.shared
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = firebaseMeneger.$laderUsers
            .map { $0 }
            .sink { [weak self] newLaderUsers in
                DispatchQueue.main.async {
                    self?.laderUsers = newLaderUsers.sorted(by: { $0.moneyBalance > $1.moneyBalance })
                }
            }
    }
    
    func calculateWinRate(payedGames: Int, winGames: Int) -> Double {
        guard payedGames > 0 else {
            return 0.0 
        }
        return Double(winGames) / Double(payedGames) * 100
    }
}
