//
//  ZeroViewStack.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

struct ZeroViewStack: View {
    @ObservedObject var viewModel: BettingBoardViewModel
    var body: some View {
        Button {
            viewModel.sectorsBetCell(viewModel.sectors.first(where: {$0.number == 0})!)
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .border(.white)
                    .frame(height: 40)
                Text("0")
                    .foregroundColor(.white)
                    .bold()
                
                if let value = viewModel.dictionarySectorsWinBets[viewModel.sectors.first(where: {$0.number == 0})!] {
                    HStack {
                        Text(value.description)
                            .bold()
                            .foregroundColor(.orange)
                            .background {
                                Color.white
                                    .cornerRadius(20)
                                    .padding(-3)
                            }
                            .offset(y: -5)
                        Spacer()
                    }
                    .padding(.leading, 3)
                }
            }
        }
        .padding(.horizontal, ScreeSize.width * 0.16)
        .offset(x: ScreeSize.width * 0.1)
    }
}

struct ZeroViewStack_Previews: PreviewProvider {
    static var previews: some View {
        ZeroViewStack(viewModel: BettingBoardViewModel())
    }
}
