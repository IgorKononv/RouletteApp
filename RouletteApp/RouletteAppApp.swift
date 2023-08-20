//
//  RouletteAppApp.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

@main
struct RouletteAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            RouletteAppTabView()
        }
    }
}
