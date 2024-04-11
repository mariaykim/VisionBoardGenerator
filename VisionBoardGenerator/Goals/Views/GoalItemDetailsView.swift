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
                .frame(maxHeight: UIScreen.main.bounds.height * 0.4)

            Spacer()
            
            VBGButton(title: "Save changes") {
                viewModel.update(item: item)
            }
            .padding(.vertical, 20)
            VBGButton(title: "Delete goal", backgroundColor: .vbgCordovan) {
                viewModel.delete(id: item.id)
            }
            .padding(.bottom, 30)
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
