//
//  SettingsTabView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

struct SettingsTabView: View {
    @StateObject var viewModel = SettingsTabViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.arraySettingsModel) { cell in
                ZStack {
                    Rectangle()
                        .frame(width: ScreeSize.width * 0.7 + 3, height: 63)
                        .foregroundColor(.black)
                    Button {
                        
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
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
    }
}
