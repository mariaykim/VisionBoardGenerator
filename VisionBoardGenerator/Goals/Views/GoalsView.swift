//
//  GoalsView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

/// The main grid view for the app, showing all the goals the user created
struct GoalsView: View {
    @StateObject var viewModel = GoalsViewViewModel()
     
    private let userId: String
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    Rectangle()
                        .fill(.green)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.cyan)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.green)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.cyan)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                }
            }
            .padding(30)
            .navigationTitle("Goals")
            .toolbar {
                Button {
                    //
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    GoalsView(userId: "")
}
