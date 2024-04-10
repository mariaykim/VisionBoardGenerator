//
//  SettingsViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SettingsViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let uId = Auth.auth().currentUser?.uid
        else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil 
                else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joinedDate: data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func logOut() {
        do {
          try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
