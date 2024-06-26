//
//  GoalItemDetailsViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class GoalItemDetailsViewViewModel: ObservableObject {
    
    init() { }
    
    func markAsCompleted(item: GoalItem) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid) // TODO: refactor
            .collection("goals")
            .document(item.id)
            .setData(item.asDictionary(), merge: true)
    }
    
    func update(item: GoalItem) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid) // TODO: refactor
            .collection("goals")
            .document(item.id)
            .setData(item.asDictionary(), merge: true)
    }
    
    func delete(id: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
    
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid) // TODO: refactor
            .collection("goals")
            .document(id)
            .delete()
    }
}
