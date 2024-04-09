//
//  User.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joinedDate: TimeInterval
}
