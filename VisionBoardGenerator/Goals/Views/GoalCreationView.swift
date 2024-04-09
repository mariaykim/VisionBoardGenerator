//
//  GoalCreationView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

struct GoalCreationView: View {
    @ObservedObject var viewModel = GoalCreationViewViewModel()
    @Binding var goalCreationViewPresented: Bool
    
    var body: some View {
        VStack{
            Text("Create a new goal")
                .font(.largeTitle)
                .bold()
                .padding(.top, 30)
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Goal Date", selection: $viewModel.goalDate)
                    .datePickerStyle(.graphical)
                VBGButton(
                    title: "Save"
                ) {
                    viewModel.save()
                    goalCreationViewPresented = false
                }
                .padding()
            }
        }
    }
}

#Preview {
    GoalCreationView(goalCreationViewPresented: .constant(true))
}
