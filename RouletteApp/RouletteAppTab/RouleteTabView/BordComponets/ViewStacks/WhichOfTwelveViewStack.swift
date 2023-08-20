//
//  WhichOfTwelveViewStack.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

struct WhichOfTwelveViewStack: View {
    @ObservedObject var viewModel: BettingBoardViewModel
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.whichOfTwelve) { betCell in
                Button {
                    viewModel.whichOfWhichOfTwelveBetCell(betCell)
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .border(.white)
                            .frame(width: ScreeSize.width * 0.1, height: 160)
                        Text(betCell.name)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.white)
                            .bold()
                        if let value = viewModel.dictionaryWhichOfTwelveWinBets.first(where: { betCell == $0.key.whichOfTwelveModel })?.value {
                            
                            Text(value.description)
                                .bold()
                                .foregroundColor(.orange)
                                .background {
                                    Color.white
                                        .cornerRadius(20)
                                        .padding(-3)
                                    
                                }
                                .offset(y: -65)
                        }
                    }
                }
                .disabled(viewModel.isAnimating)
            }
        }
        .offset(x: -ScreeSize.width * 0.29)
    }
}

struct WhichOfTwelveViewStack_Previews: PreviewProvider {
    static var previews: some View {
        WhichOfTwelveViewStack(viewModel: BettingBoardViewModel())
    }
}
