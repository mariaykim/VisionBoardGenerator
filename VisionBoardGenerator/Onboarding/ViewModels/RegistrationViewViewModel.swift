//
//  RegistrationViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

final class RegistrationViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else { return }
            
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joinedDate: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        
//        db.collection("users")
//            .document(id)
//            .setData(<#T##documentData: [String : Any]##[String : Any]#>)
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errorMessage = "Please provide valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please provide a password at least six character in length"
            return false
        }
        
        return true
    }
}
