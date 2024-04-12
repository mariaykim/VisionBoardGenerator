//
//  GoalItem.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import Foundation

struct GoalItem: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let description: String
    let goalDate: TimeInterval
    let createdDate: TimeInterval
    let isCompleted: Bool
    let goalCompletedDate: TimeInterval?
    
    init(id: String, title: String, description: String, goalDate: TimeInterval, createdDate: TimeInterval, isCompleted: Bool = false, goalCompletedDate: TimeInterval? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.goalDate = goalDate
        self.createdDate = createdDate
        self.isCompleted = isCompleted
        self.goalCompletedDate = goalCompletedDate
    }
}
