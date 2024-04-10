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
            Image(systemName: "cat")
                .resizable()
                .frame(width: 150, height: 150)
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
            description: "desc",
            goalDate: 35,
            createdDate: 23
        )
    )
}
