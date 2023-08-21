//
//  SettingsTabView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI
import StoreKit

struct SettingsTabView: View {
    @Environment(\.requestReview) var requestReview
    @StateObject var viewModel = SettingsTabViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.arraySettingsModel) { cell in
                ZStack {
                    Rectangle()
                        .frame(width: ScreeSize.width * 0.7 + 3, height: 63)
                        .foregroundColor(.black)
                    Button {
                        if cell == .rateApp {
                            requestReview()
                        }
                        viewModel.clickButton(cell)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: ScreeSize.width * 0.7, height: 60)
                                .foregroundColor(.yellow)
                            Text(cell.name)
                                .bold()
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isShareSheetPresented) {
            ShareView(shareText: viewModel.shareText)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Warning"),
                message: Text("Do you really want to delete ? All data will be lost"),
                primaryButton: .default(Text("Delete"), action: {
                    viewModel.deleteAccount()
                }),
                secondaryButton: .cancel(Text("Close"), action: {})
            )
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
    }
}
