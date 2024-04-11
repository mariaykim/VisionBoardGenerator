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
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 10), GridItem(.flexible())]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/goals")
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(items) { item in
                        NavigationLink(value: item) {
                            GoalItemView(item: item)
                        }
                    }
                }
            }
            .background(.vbgWenge)
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.showingGoalCreationView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .toolbarBackground(.vbgWenge)
            .navigationTitle("Goals")
            .navigationDestination(for: GoalItem.self) { item in
                GoalItemDetailsView(item: item)
            }
            .sheet(isPresented: $viewModel.showingGoalCreationView) {
                GoalCreationView(goalCreationViewPresented: $viewModel.showingGoalCreationView)
                    .background(.vbgIsabelline)
            }
        }
    }
}

#Preview {
    GoalsView(userId: "sJTeemjWjohvegGIg2n5Lx3Ncut1")
}
