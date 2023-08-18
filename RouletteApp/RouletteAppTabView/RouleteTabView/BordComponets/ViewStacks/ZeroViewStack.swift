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
            
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .border(.white)
                    .frame(height: 30)
                Text("0")
                    .foregroundColor(.white)
                    .bold()
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
