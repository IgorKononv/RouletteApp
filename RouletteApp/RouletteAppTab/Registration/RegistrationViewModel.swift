//
//  RegistrationViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {

    let authMeneger = AuthMeneger.shared
    
    func signInAnanonimuslu() {
        Task {
            try await authMeneger.signInAnanonimuslu()
        }
    }
}

