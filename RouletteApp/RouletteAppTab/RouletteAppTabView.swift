//
//  RouletteAppTabView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 19.08.2023.
//

import SwiftUI

struct RouletteAppTabView: View {
    @StateObject var viewModel = RouletteAppTabViewModel()
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.rouletteAppTabModel) {
                RouleteTabView()
                    .tag(RouletteAppTabModel.game)
                RatingTabView()
                    .tag(RouletteAppTabModel.rating)
                SettingsTabView()
                    .tag(RouletteAppTabModel.settings)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            TabBarForAppView(viewModel: viewModel)
        }
        .ignoresSafeArea()
    }
}

struct RouletteAppTabView_Previews: PreviewProvider {
    static var previews: some View {
        RouletteAppTabView()
    }
}
