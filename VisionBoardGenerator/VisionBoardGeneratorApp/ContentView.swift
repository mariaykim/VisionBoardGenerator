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
                GoalsView()
            }
        } else {
            NavigationStack {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
