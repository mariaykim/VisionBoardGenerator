//
//  HeaderView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let backgroundColor: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(backgroundColor.gradient)
            VStack {
                Text(title)
                    .font(.largeTitle)
                Text(subtitle)
                    .font(.title2)
            }
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", backgroundColor: .cyan)
}
