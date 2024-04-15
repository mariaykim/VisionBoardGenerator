//
//  ContentView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            TabView {
                mainView
                    .background(.vbgWenge)
            }
            .background(.vbgWenge)
            .padding(.horizontal, 30)
        } else {
            NavigationStack {
                LoginView()
                    .background(.vbgWenge)
                    .toolbarBackground(.vbgWenge)
            }
            .background(.vbgWenge)
            .padding(.horizontal, 30)
        }
    }
    
    @ViewBuilder
    var mainView: some View {
        Group {
        GoalsView(userId: viewModel.currentUserId)
            .tabItem {
                Label("Goals", systemImage: "star")
            }
        SettingsView()
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
        .toolbar(.hidden)
        .toolbarBackground(.vbgWenge, for: .tabBar)
        .toolbarBackground(.vbgWenge, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
