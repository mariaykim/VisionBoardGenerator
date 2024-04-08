//
//  ContentView.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/8/24.
//

import OpenAIKit
import SwiftUI

final class ViewModel: ObservableObject {
    private var openai: OpenAI?
    
    func setup() {
        openai = OpenAI(Configuration(
            organizationId: "Personal",
            apiKey: APIKeys.openAIKey
        ))
    }
    
    func generateImage(prompt: String) async -> UIImage? {
        guard let openai = openai else {
            return nil
        }
        
        do {
            let params = ImageParameters(
                prompt: prompt,
                resolution: .medium,
                responseFormat: .base64Json
            )
            let result = try await openai.createImage(parameters: params)
            let data = result.data[0].image
            let image = try openai.decodeBase64Image(data)
            return image
        }
        catch {
            print(String(describing: error))
            return nil
        }
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = String()
    @State var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
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
            .navigationTitle("Vision Board Generator")
            .onAppear {
                viewModel.setup()
            }
            .padding()
        }
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
    ContentView()
}
