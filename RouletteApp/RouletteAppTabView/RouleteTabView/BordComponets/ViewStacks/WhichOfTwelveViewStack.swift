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
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .border(.white)
                            .frame(width: ScreeSize.width * 0.1, height: 120)
                        Text(betCell.name)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.white)
                            .bold()
                    }
                }
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
