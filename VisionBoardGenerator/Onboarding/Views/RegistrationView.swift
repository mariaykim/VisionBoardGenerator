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
            VStack(spacing: 0) {
                HeaderView(
                    title: "Registration",
                    subtitle: "First Step To Achieving Your Goals",
                    backgroundColor: Color(.vbgEcru)
                )
                .padding(.bottom, 30)
                
                registrationFormView
                
                Spacer()
            }
            .background(.vbgWenge)
        }
    }
    
    var registrationFormView: some View {
        VStack(spacing: 0) {
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
                .padding(.vertical, 10)
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            VBGButton(title: "Create Account", backgroundColor: .vbgEcru) {
                viewModel.register()
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    RegistrationView()
}
