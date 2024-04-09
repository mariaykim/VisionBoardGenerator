//
//  RegistrationView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
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
            TextField("Full Name", text: $name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            TextField("Email Address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            VBGButton(title: "Create Account", backgroundColor: .blue) {
                //
            }
            .padding(.vertical, 15)
        }
    }
}

#Preview {
    RegistrationView()
}
