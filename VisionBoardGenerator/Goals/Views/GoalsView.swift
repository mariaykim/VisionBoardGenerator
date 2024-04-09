//
//  GoalsView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

/// The main grid view for the app, showing all the goals the user created
struct GoalsView: View {
//    @State private var goals
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout) {
//                ForEach(goals) { goal in
//                    NavigationLink(value: goal) {
//                        GoalGridItem(goal: goal)
//                    }
//                }
            }
        }
    }
}

#Preview {
    GoalsView()
}
