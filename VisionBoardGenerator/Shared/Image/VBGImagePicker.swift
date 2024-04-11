//
//  VBGImagePicker.swift
//  VisionBoardGenerator
//
//  Created by Maria Kim on 4/11/24.
//

import PhotosUI
import SwiftUI

struct VBGImagePicker: View {
    @State var selectedItem: PhotosPickerItem?
    @State var data: Data?
    
    var body: some View {
        VStack {
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
            }
            Spacer()
            HStack {
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images
                ) {
                    Label("Photos Library", systemImage: "photo.fill.on.rectangle.fill")
                }
                .onChange(of: selectedItem) { newValue in
                    guard let item = selectedItem else { return }
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print("Data is nil")
                            }
                        case .failure(let failure):
                            fatalError("\(failure)")
                        }
                    }
                }
            }
        }
    }
}
