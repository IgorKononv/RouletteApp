//
//  BettingBoardView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

struct BettingBoardView: View {
    @StateObject var viewModel = BettingBoardViewModel()
    var body: some View {
        ZStack {
            BottomViewStack(viewModel: viewModel)
            WhichOfTwelveViewStack(viewModel: viewModel)
            
            VStack(spacing: 0) {
                ZeroViewStack(viewModel: viewModel)
                SectorsViewStack(viewModel: viewModel)
                WhichOfTwoInOneViewStack(viewModel: viewModel)
            }
        }
    }
}
struct BettingBoardView_Previews: PreviewProvider {
    static var previews: some View {
        BettingBoardView()
    }
}
