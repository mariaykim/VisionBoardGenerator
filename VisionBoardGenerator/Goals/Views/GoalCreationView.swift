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
                    if viewModel.canSave() {
                        viewModel.save()
                        goalCreationViewPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(
                title: Text("Error!"),
                message: Text("Please fill in all fields and select a valid goal date")
            )
        })
    }
}

#Preview {
    GoalCreationView(goalCreationViewPresented: .constant(true))
}
