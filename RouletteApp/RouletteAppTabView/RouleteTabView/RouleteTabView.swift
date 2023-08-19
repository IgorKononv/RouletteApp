//
//  RouleteTabView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

struct RouleteTabView: View {
    @StateObject var viewModel = RouleteTabViewModel()
    var body: some View {
        ZStack {
            Image("bord_image")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    RouletteView()
                    BettingBoardView()
                }
                .padding(.top, ScreeSize.height * (viewModel.didShowMore ? 0.2 : 0.1) + 20)
                .padding(.bottom)
            }
            VStack(spacing: 0) {
                ZStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: ScreeSize.height * (viewModel.didShowMore ? 0.25 : 0.15))
                            .ignoresSafeArea()
                        Spacer()
                    }
                    VStack {
                        HStack {
                            VStack {
                                HStack {
                                    Button {
                                        viewModel.changeRate(isPlus: true)
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(.black)
                                                .cornerRadius(10)
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                                .cornerRadius(10)
                                            Text("+")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                    Text("\(viewModel.rate)")
                                    Button {
                                        viewModel.changeRate(isPlus: false)
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(.black)
                                                .cornerRadius(10)
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.gray)
                                                .cornerRadius(10)
                                            Text("-")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                Button {
                                    viewModel.showMore()
                                } label: {
                                    Text("More")
                                }
                            }
                            Spacer()
                            Text(viewModel.isAnimating ? "Spinning ..." : "Sector \n \(viewModel.currentSector.number) \(viewModel.currentSector.color.rawValue)")
                                .multilineTextAlignment(.center)
                            Spacer()
                            
                            Text(viewModel.moneyBalance.description)
                        }
                        if viewModel.didShowMore {
                            ZStack {
                                Rectangle()
                                    .frame(height: 72)
                                    .foregroundColor(.black)
                                Rectangle()
                                    .frame(height: 70)
                                    .foregroundColor(.gray)
                                VStack {
                                    HStack {
                                        ForEach(viewModel.valuesBet, id: \.self) { value in
                                            Button {
                                                viewModel.rate = value
                                            } label: {
                                                Text(value.description)
                                                    .bold()
                                                    .foregroundColor(.orange)
                                                    .background {
                                                        Color.white
                                                            .cornerRadius(20)
                                                            .padding(-3)
                                                    }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
