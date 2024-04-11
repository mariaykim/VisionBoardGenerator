//
//  GoalItemDetailsView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct GoalItemDetailsView: View {
    @StateObject var viewModel = GoalItemDetailsViewViewModel()
    @State var goalDescriptionText = ""
    
    let item: GoalItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.title)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            HStack(spacing: 0) {
                Text("Goal Date: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.goalDate).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.bottom, 20)
            
            Text("Goal Description")
                .bold()
            TextEditor(text: $goalDescriptionText)
                .padding(.bottom, 20)

            Spacer()
            VBGButton(title: "Save changes") {
                viewModel.update(item: item)
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 20)
            VBGButton(title: "Delete goal") {
                viewModel.delete(id: item.id)
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 30)
        .onAppear {
            goalDescriptionText = item.description
        }
    }
}

#Preview {
    GoalItemDetailsView(item: .init(id: "", title: "Buy a new car", description: "I want a tesla", goalDate: 25, createdDate: 27))
}
