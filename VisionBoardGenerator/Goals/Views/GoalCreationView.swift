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
        ScrollView {
            Text("Create a new goal")
                .font(.largeTitle)
                .bold()
                .padding(.top, 30)
            VStack(alignment: .leading) {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Description", text: $viewModel.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Goal Date", selection: $viewModel.goalDate)
                    .datePickerStyle(.graphical)
                Spacer()
                Text("Select a goal image")
                    .font(.title3)
                    .bold()
                VBGImagePicker()
                    .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.width - 60)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                .padding(.vertical, 30)
            }
            .background(.vbgIsabelline)
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error!"),
                    message: Text("Please fill in all fields and select a valid goal date")
                )
            })
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    GoalCreationView(goalCreationViewPresented: .constant(true))
}
