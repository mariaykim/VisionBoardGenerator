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
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 15)
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
                    
                    Spacer()
                    
                    VBGButton(
                        title: "Log Out",
                        backgroundColor: .vbgCordovan
                    ) {
                        viewModel.logOut()
                    }
                    .padding(.bottom, 30)

                } else {
                    Text("Loading settings...")
                }
            }
            .toolbar(.visible) // TODO: refactor
            .toolbarBackground(.vbgWenge)
            .background(.vbgWenge)
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    SettingsView()
}
