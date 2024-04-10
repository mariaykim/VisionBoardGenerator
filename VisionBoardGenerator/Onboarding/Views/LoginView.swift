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
            VStack {
                // Header
                HeaderView(
                    title: "Vision Board Generator",
                    subtitle: "see it & believe you can achieve it",
                    backgroundColor: .green
                )
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                // Login Form
                loginFormView
                // Create Account
                createAccountView
            }
            .padding(30)
        }
    }
    
    var loginFormView: some View {
        Form {
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
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
        .padding(.bottom, 30)
    }
}

#Preview {
    LoginView()
}
