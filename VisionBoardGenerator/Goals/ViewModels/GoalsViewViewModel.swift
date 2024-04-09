//
//  GoalsViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import Foundation

/// A class that loads, saves, updates goals
final class GoalsViewViewModel: ObservableObject {
    @Published var showingGoalCreationView = false
    
    init() {}
}
