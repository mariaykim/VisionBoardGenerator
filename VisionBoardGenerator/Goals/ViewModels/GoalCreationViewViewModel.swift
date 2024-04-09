//
//  GoalCreationViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import SwiftUI

final class GoalCreationViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var goalDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        //
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        
        guard goalDate >= Date().addingTimeInterval(-86400) else { return false }
        
        return true
    }
}
