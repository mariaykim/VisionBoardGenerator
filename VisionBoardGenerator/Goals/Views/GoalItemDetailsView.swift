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
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text(item.title)
                    .font(.title)
                    .bold()
                    .lineLimit(4)
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
                    .backgroundStyle(.vbgIsabelline)
                    .cornerRadius(10)
                    .frame(minHeight: UIScreen.main.bounds.height * 0.25, maxHeight: UIScreen.main.bounds.height * 0.4)
                
                VBGButton(title: "Mark as completed") {
                    viewModel.markAsCompleted(item: .init(id: item.id, title: item.title, description: goalDescriptionText, goalDate: item.goalDate, createdDate: item.createdDate, isCompleted: true, goalCompletedDate: Date().timeIntervalSince1970 + 5))
                }
                .padding(.top, 20)
                VBGButton(title: "Save changes") {
                    viewModel.update(item: .init(id: item.id, title: item.title, description: goalDescriptionText, goalDate: item.goalDate, createdDate: item.createdDate))
                }
                .padding(.vertical, 20)
                VBGButton(title: "Delete goal", backgroundColor: .vbgCordovan) {
                    viewModel.delete(id: item.id)
                }
                .padding(.bottom, 30)
            }
        }
        .background(.vbgWenge)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    //
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .toolbarBackground(.vbgWenge)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            goalDescriptionText = item.description
        }
    }
}

#Preview {
    GoalItemDetailsView(item: .init(id: "", title: "Testing a really long goal title because the more words the better am I right? Adding one more sentence just in case.", description: "I want a tesla", goalDate: 25, createdDate: 27))
}
