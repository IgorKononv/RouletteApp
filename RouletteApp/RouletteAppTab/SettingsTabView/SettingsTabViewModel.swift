//
//  SettingsTabViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

class SettingsTabViewModel: ObservableObject {
   @Published var arraySettingsModel: [SettingsModel] = SettingsModel.allCases
}
