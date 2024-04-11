//
//  VBGButton.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct VBGButton: View {
    let title: String
    var backgroundColor: Color = .vbgEcru
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
                Text(title)
                    .foregroundStyle(.vbgIsabelline)
                    .bold()
                    .padding(5)
                    .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(backgroundColor)
    }
}

#Preview {
    VBGButton(title: "Button Title", backgroundColor: .vbgEerieBlack) {
        //
    }
}
