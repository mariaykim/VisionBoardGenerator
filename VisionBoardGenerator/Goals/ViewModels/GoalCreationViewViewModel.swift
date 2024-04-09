//
//  GoalCreationViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

final class GoalCreationViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var goalDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave() else { return }

        guard let uid = Auth.auth().currentUser?.uid else { return }
    }
    
    private func insertGoalRecord(id: String) {
        let newId = UUID().uuidString
        let newGoal = GoalItem(
            id: newId,
            title: title,
            goalDate: goalDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .collection("goals")
            .document(id)
            .setData(newGoal.asDictionary())
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        
        guard goalDate >= Date().addingTimeInterval(-86400) else { return false }
        
        return true
    }
}
