//
//  RegistrationView.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @FocusState var isTextFieldFocused: Bool
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .onTapGesture {
                    viewModel.authMeneger.showAlertName = false
                    isTextFieldFocused = false
                }
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
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: ScreeSize.height * 0.4 + 5)
                    .cornerRadius(20)

                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: ScreeSize.height * 0.4)
                    .cornerRadius(20)
                VStack {
                    Text("Please enter your name")
                        .bold()
                        .font(.title3)
                        .offset(y: -ScreeSize.height * 0.05)

                    TextField("tap here..", text: $viewModel.nameCreated , onCommit: {
                        viewModel.signInAnanonimuslu()
                        isTextFieldFocused = false
                    })
                        .focused($isTextFieldFocused)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: viewModel.nameCreated) { newValue in
                            if viewModel.nameCreated.count > 15 {
                                viewModel.nameCreated.removeLast()
                            }
                        }
                    Button {
                        isTextFieldFocused = false
                        viewModel.signInAnanonimuslu()
                    } label: {
                        Text("GO!")
                            .bold()
                            .foregroundColor(.red)
                            .opacity(viewModel.nameCreated == "" ? 0.5 : 1)
                    }
                }
            }
            .frame(height: ScreeSize.height * 0.4)
            .offset(y: -ScreeSize.height * (viewModel.showAlertName ? 0 : 1))
            .onChange(of: viewModel.showAlertName) { newValue in
                if newValue {
                    isTextFieldFocused = true
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
