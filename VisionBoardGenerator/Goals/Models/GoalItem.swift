//
//  GoalItem.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import Foundation

struct GoalItem: Codable, Identifiable {
    let id: String
    let title: String
    let goalDate: TimeInterval
    let createdDate: TimeInterval
}
