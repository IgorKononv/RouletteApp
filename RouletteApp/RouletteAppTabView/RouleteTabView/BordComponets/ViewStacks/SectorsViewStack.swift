//
//  SectorsViewStack.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

struct SectorsViewStack: View {
    @ObservedObject var viewModel: BettingBoardViewModel
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 0) {
                ForEach(viewModel.sectors, id: \.number) { betCell in
                    if betCell.number != 0 {
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(betCell.color.color))
                                    .border(.white)
                                    .frame(height: 30)
                                Text(betCell.number.description)
                                    .foregroundColor(.white)
                                    .bold()
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

struct SectorsViewStack_Previews: PreviewProvider {
    static var previews: some View {
        SectorsViewStack(viewModel: BettingBoardViewModel())
    }
}
