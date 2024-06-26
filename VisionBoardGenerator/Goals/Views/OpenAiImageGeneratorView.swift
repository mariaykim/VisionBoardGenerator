//
//  OpenAiImageGeneratorView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import SwiftUI

struct OpenAiImageGeneratorView: View {
    @ObservedObject var viewModel = OpenAiImageGeneratorViewViewModel()
    @State var text = String()
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            Text("AI Image Generator")
                .font(.largeTitle)
                .bold()
            Spacer()
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } else {
                Text("Type prompt to generate image")
            }
            Spacer()
            TextField("Type prompt here...", text: $text)
                .padding()
            Button("Generate!") {
                if !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { // saving on credits
                    Task {
                        await generateImage(prompt: text)
                    }
                }
            }
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()
    }
    
    func generateImage(prompt: String) async {
        let result = await viewModel.generateImage(prompt: text)
        if result == nil {
            print("Failed to retrieve image")
        }
        self.image = result
    }
}

#Preview {
    OpenAiImageGeneratorView()
}
