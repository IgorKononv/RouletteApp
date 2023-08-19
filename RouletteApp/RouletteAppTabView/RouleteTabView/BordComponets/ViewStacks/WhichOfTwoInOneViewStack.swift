//
//  WhichOfTwoInOneViewStack.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

struct WhichOfTwoInOneViewStack: View {
    @ObservedObject var viewModel: BettingBoardViewModel

    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 0) {
                ForEach(viewModel.whichOfTwoInOne, id: \.hashValue) { betCell in
                    Button {
                        viewModel.whichOfTwoInOneBetCell(betCell)
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .border(.white)
                                .frame(height: 40)
                            Text("2-1")
                                .foregroundColor(.white)
                                .bold()

                            if let value = viewModel.dictionaryWhichOfTwoInOneWinBets.first(where: { betCell == $0.key.whichOfTwoInOne })?.value {
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
                }
                .padding(.horizontal, -4)
            }
        }
        .padding(.horizontal, ScreeSize.width * 0.17)
        .offset(x: ScreeSize.width * 0.1)
    }
}

struct WhichOfTwoInOneViewStack_Previews: PreviewProvider {
    static var previews: some View {
        WhichOfTwoInOneViewStack(viewModel: BettingBoardViewModel())
    }
}
