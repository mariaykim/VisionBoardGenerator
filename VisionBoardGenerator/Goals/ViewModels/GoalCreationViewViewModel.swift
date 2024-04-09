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
    
    init() {}
    
    func save() {
        //
    }
    
    func canSave() {
        //
    }
}
