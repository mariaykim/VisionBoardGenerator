//
//  OpenAiImageGeneratorViewViewModel.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/9/24.
//

import OpenAIKit
import SwiftUI

final class OpenAiImageGeneratorViewViewModel: ObservableObject {
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
