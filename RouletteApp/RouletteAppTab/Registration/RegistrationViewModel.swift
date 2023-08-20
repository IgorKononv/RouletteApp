//
//  RegistrationViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var showAlertName = false
    @Published var nameCreated = "" {
        didSet {
            authMeneger.nameCreated = nameCreated
        }
    }
    let authMeneger = FirebaseMeneger.shared
    
    init() {
        authMeneger.$showAlertName
            .map { $0 }
            .assign(to: &$showAlertName)
    }
    func signInAnanonimuslu() {
        Task {
            try await authMeneger.signInAnanonimuslu()
        }
    }
}

