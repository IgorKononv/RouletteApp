//
//  RegistrationView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Wellcome to - RouletteApp")
                    .bold()
                    .font(.title)
                
                Image("game_icon")
                
                ZStack {
                    Rectangle()
                        .frame(width: ScreeSize.width * 0.7 + 3, height: 73)
                        .foregroundColor(.black)
                    Button {
                        viewModel.signInAnanonimuslu()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: ScreeSize.width * 0.7, height: 70)
                                .foregroundColor(.red)
                            HStack {
                                Image("ananonimuslu_icon")
                                    .padding(.horizontal)
                                Text("Sign in Ananonimuslu")
                                    .foregroundColor(.black)
                                    .bold()
                                Spacer()
                            }
                        }
                    }
                    .frame(width: ScreeSize.width * 0.7, height: 70)
                }
                ZStack {
                    Rectangle()
                        .frame(width: ScreeSize.width * 0.7 + 3, height: 73)
                        .foregroundColor(.black)
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: ScreeSize.width * 0.7, height: 70)
                                .foregroundColor(.white)
                            HStack {
                                Image("email_icon")
                                    .padding(.horizontal)
                                Text("Sign in with Email")
                                    .foregroundColor(.black)
                                    .bold()
                                Spacer()
                            }
                        }
                    }
                    .frame(width: ScreeSize.width * 0.7, height: 70)
                }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
