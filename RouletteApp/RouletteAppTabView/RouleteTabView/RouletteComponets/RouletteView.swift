//
//  ContentView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

struct RouletteView: View {
    @StateObject var viewModel = RouletteViewModel()
    var body: some View {
        VStack {
            Image("Arrow")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            Image("roulette")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: viewModel.spinDegrees))
                .frame(width: 245, height: 245)
            
            Button {
                viewModel.doSpin()
            } label: {
                Text("SPIN")
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RouletteView()
    }
}


