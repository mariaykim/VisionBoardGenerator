//
//  VBGButton.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct VBGButton: View {
    let title: String
    var backgroundColor: Color = .blue
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(5)
            }
        }
    }
}

#Preview {
    VBGButton(title: "Button Title", backgroundColor: .purple) {
        //
    }
}
