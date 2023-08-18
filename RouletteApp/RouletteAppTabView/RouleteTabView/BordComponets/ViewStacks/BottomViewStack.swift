//
//  BottomViewStack.swift
//  RouletteApp
//
//  Created by Igor Kononov on 18.08.2023.
//

import SwiftUI

struct BottomViewStack: View {
    @ObservedObject var viewModel: BettingBoardViewModel
    var body: some View {
        VStack(spacing: 0) {
            ForEach(1...6, id: \.self) { betCell in
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(betCell == 3 ? Color("Red") : betCell == 4 ? Color("Black") : .clear)
                            .border(.white)
                            .frame(width: ScreeSize.width * 0.1, height: 60)
                        if betCell == 1 {
                            Text("1-18")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.white)
                                .bold()
                        } else if betCell == 2 {
                            Text("Even")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.white)
                                .bold()
                        } else if betCell == 3 {
                            Text("Red")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.white)
                                .bold()
                        } else if betCell == 4 {
                            Text("Black")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.white)
                                .bold()
                        } else if betCell == 5 {
                            Text("Odd")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.white)
                                .bold()
                        } else {
                            Text("19-36")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }
        }
        .offset(x: -ScreeSize.width * 0.39)
    }
}

struct BottomViewStack_Previews: PreviewProvider {
    static var previews: some View {
        BottomViewStack(viewModel: BettingBoardViewModel())
    }
}
