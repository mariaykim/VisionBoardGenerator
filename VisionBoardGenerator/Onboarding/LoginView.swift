//
//  LoginView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                headerView
                // Login Form
                loginFormView
                // Create Account
                createAccountView
            }
            .padding(30)
        }
    }
    
    var headerView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.green.gradient)
            VStack {
                Text("Vision Board Generator")
                    .font(.largeTitle)
                Text("see it, believe it")
                    .font(.title2)
            }
        }
    }
    
    var loginFormView: some View {
        Form {
            TextField("Email Address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            Button {
                //
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Log In")
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            .padding(.vertical, 15)
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
