//
//  RouleteTabView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

struct RouleteTabView: View {
    var body: some View {
        ZStack {
            Image("bord_image")
                .resizable()
                .ignoresSafeArea()
            VStack {
                RouletteView()
                ScrollView {
                    BettingBoardView()
                }
            }
        }
    }
}
