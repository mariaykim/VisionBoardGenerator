//
//  GoalsView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import FirebaseFirestoreSwift
import SwiftUI

/// The main grid view for the app, showing all the goals the user created
struct GoalsView: View {
    @StateObject var viewModel = GoalsViewViewModel()
    @FirestoreQuery var items: [GoalItem]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/goals")
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(items) { item in
                        GoalItemView(item: item)
                    }
                }
            }
            .padding(30)
            .navigationTitle("Goals")
            .toolbar {
                Button {
                    viewModel.showingGoalCreationView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingGoalCreationView) {
                GoalCreationView(goalCreationViewPresented: $viewModel.showingGoalCreationView)
            }
        }
    }
}

#Preview {
    GoalsView(userId: "sJTeemjWjohvegGIg2n5Lx3Ncut1")
}
