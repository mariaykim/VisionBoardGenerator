//
//  HeaderView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI
import UIKit

struct HeaderView: View {
    let title: String?
    let subtitle: String?
    let image: UIImage?
    let backgroundColor: Color
    
    init(
        title: String? = nil,
        subtitle: String? = nil,
        image: UIImage? = nil,
        backgroundColor: Color = .blue
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .cornerRadius(10)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor.gradient)
            }
            VStack {
                if let title = title {
                    Text(title)
                        .font(.largeTitle)
                }
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.title2)
                }
            }
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", backgroundColor: .cyan)
}
