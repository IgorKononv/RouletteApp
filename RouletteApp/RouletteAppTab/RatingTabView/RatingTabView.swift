//
//  RatingTabView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

struct RatingTabView: View {
    @StateObject var viewModel = RatingTabViewModel()

    var body: some View {
        ZStack {
            VStack {
                Text("Richest people list")
                    .bold()
                    .padding(.top, ScreeSize.height * 0.05)
                
                ScrollView {
                    LazyVStack {
                        ForEach(Array(viewModel.laderUsers.enumerated()), id: \.element.id) { index, cell in
                            ZStack {
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 2)
                                }
                                HStack(spacing: 30) {
                                    Image(index == 0 ? "first_icon" : index == 1 ? "second_icon" : index == 2 ? "third_icon" : index < 10 ? "topTen_icon" : "")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.blue)
                                    
                                    Text("\(index + 1)")
                                    
                                    Spacer()
                                    
                                    VStack {
                                        HStack {
                                            Text("Name - ")
                                            Text(cell.userName)
                                        }
                                        HStack {
                                            Text("Money - ")
                                            Text(cell.moneyBalance.description)
                                        }
                                        HStack {
                                            Text("Win rate - ")
                                            Text(String(format: "%.1f%%", viewModel.calculateWinRate(payedGames: cell.payedGames, winGames: cell.winGames)))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical)
                }
            }
        }
    }
}

struct RatingTabView_Previews: PreviewProvider {
    static var previews: some View {
        RatingTabView()
    }
}
