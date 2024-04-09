//
//  RegistrationViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import Foundation

final class RegistrationViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
}
