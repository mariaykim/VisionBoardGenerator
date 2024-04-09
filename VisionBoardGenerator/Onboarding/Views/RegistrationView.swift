//
//  RegistrationView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(
                    title: "Registration",
                    subtitle: "first step to achieving your goals",
                    backgroundColor: .pink
                )
                registrationFormView
            }
        }
    }
    
    var registrationFormView: some View {
        Form {
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            VBGButton(title: "Create Account", backgroundColor: .blue) {
                viewModel.register()
            }
            .padding()
        }
    }
}

#Preview {
    RegistrationView()
}
