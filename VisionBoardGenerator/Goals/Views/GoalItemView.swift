//
//  GoalItemView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

struct GoalItemView: View {
    let item: GoalItem
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            Image(systemName: "cat")
                .resizable()
                .frame(width: 200, height: 200)
            Text(item.title)
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    GoalItemView(
        item: .init(
            id: "id",
            title: "title",
            goalDate: 35,
            createdDate: 23,
            isDone: false
        )
    )
}
