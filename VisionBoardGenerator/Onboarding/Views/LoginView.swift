//
//  LoginView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header
                HeaderView(
                    image: UIImage(named: "LoginImage")
                )
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                // Login Form
                loginFormView
                    .padding(.top, 20)
                
                Spacer()
                
                // Create Account
                createAccountView
                    .padding(.bottom, 30)
            }
        }
        .toolbar(.visible)
    }
    
    var loginFormView: some View {
        VStack(spacing: 0) {
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 10)
            VBGButton(title: "Log in", backgroundColor: .blue) {
                viewModel.login()
            }
        }
    }
    
    var createAccountView: some View {
        VStack {
            Text("New around here?")
            NavigationLink("Create an account", destination: RegistrationView())
        }
    }
}

#Preview {
    LoginView()
}
