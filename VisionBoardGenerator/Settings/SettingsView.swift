//
//  SettingsView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if let user = viewModel.user {
                    HStack(spacing: 0) {
                        Text("Name: ")
                            .bold()
                        Text(user.name)
                    }
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 0) {
                        Text("Email: ")
                            .bold()
                        Text(user.email)
                    }
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 0) {
                        Text("Member since: ")
                            .bold()
                        Text("\(Date(timeIntervalSince1970: user.joinedDate).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding(.bottom, 20)
                    
                    VBGButton(
                        title: "Log Out",
                        backgroundColor: .red
                    ) {
                        viewModel.logOut()
                    }
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

                } else {
                    Text("Loading settings...")
                }
            }
            .navigationTitle("Settings")
            .padding()
            
            Spacer()
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    SettingsView()
}
