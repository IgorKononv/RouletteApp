//
//  SettingsTabViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI
import StoreKit

class SettingsTabViewModel: ObservableObject {
    @Environment(\.requestReview) var requestReview
    @Published var arraySettingsModel: [SettingsModel] = SettingsModel.allCases
    @Published var isShareSheetPresented = false
    @Published var showAlert = false
    @Published var shareText = ""
    
    let authMeneger = AuthMeneger.shared
    
    func clickButton(_ cell: SettingsModel) {
        switch cell {
            
        case .rateApp:
            break
        case .shareGame:
            tapShareButton()
        case .logOut:
            logOut()
        case .delete:
            showAlert = true
        }
    }
    
    private func logOut() {
        authMeneger.currentUser = nil
    }
    
    func deleteAccount() {
        authMeneger.deleteAccount()        
    }
    
    func tapShareButton() {
        shareText = "Download RouletteApp now on AppStore: https://apps.apple.com/us/app/RouletteApp"
        isShareSheetPresented = true
    }
}
