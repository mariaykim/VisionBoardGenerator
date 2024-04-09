//
//  ContentView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                GoalsView()
            }.tabItem {
                Label("Home", systemImage: "house")
            }
        }
    }
}

#Preview {
    ContentView()
}
