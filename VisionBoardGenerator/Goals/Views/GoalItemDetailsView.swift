//
//  GoalItemDetailsView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct GoalItemDetailsView: View {
    @StateObject var viewModel = GoalItemDetailsViewViewModel()
    
    let item: GoalItem
    
    var body: some View {
        Form {
            Text(item.title)
            Text(String(item.createdDate))
            VBGButton(title: "Delete goal") {
                viewModel.delete(id: item.id)
            }
        }
    }
}

#Preview {
    GoalItemDetailsView(item: .init(id: "", title: "title", goalDate: 25, createdDate: 27))
}
