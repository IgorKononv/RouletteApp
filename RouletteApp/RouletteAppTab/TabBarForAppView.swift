//
//  TabForAppView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 19.08.2023.
//

import SwiftUI

struct TabBarForAppView: View {
    @ObservedObject var viewModel: RouletteAppTabViewModel
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .frame(height: ScreeSize.height * 0.11)
                    .foregroundColor(.white)
                HStack {
                    ForEach(viewModel.arayRouletteAppTabModel, id: \.name) { tab in
                        Spacer()
                        Button {
                            viewModel.selectTab(tab)
                        } label: {
                            VStack(spacing: 0) {
                                Image(tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: viewModel.rouletteAppTabModel == tab ? 50 : 40)
                                Text(tab.name)
                                    .fontWeight(viewModel.rouletteAppTabModel == tab ? .semibold : .regular)
                                    .foregroundColor(.red)
                                    .opacity(viewModel.rouletteAppTabModel == tab ? 1 : 0.7)
                                    
                            }
                            .frame(width: viewModel.rouletteAppTabModel == tab ? 90 : 80)
                            .offset(y: viewModel.rouletteAppTabModel == tab ? -5 : 0)
                        }
                        Spacer()
                    }   
                }
                .padding(.horizontal)
            }
            .offset(y: viewModel.isIncreasing ? ScreeSize.height * 0.15 : 0)
            .animation(.easeOut)
        }
    }
}

struct TabForAppView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarForAppView(viewModel: RouletteAppTabViewModel())
    }
}
