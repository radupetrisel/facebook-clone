//
//  CreatePostView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 19.03.2024.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var text: String = ""
    
    @State private var isPhotosPickerShown = false
    @State private var selectedPhotoPickerItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    let viewModel: FeedViewModel
    
    var user: User { viewModel.currentUser }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: user.profileImageName ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Image(.noProfile).resizable()
                    }
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)
                    
                    VStack(alignment: .leading) {
                        Text(user.fullName)
                        
                        HStack {
                            ChoiceView(image: "person.2.fill", text: "Friends")
                            
                            ChoiceView(image: "person.2", text: "Album")
                        }
                        
                        ChoiceView(image: "camera", text: "Off")
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                TextField("What's on your mind?", text: $text, axis: .vertical)
                    .padding(.horizontal)
                
                if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                        .padding(.top)
                }
                
                Spacer()
                
                Divider()
                
                HStack {
                    Spacer()
                    
                    Button("Add photo", systemImage: "photo.fill.on.rectangle.fill") {
                        isPhotosPickerShown.toggle()
                    }
                    .labelStyle(.iconOnly)
                    .foregroundStyle(.green)
                    
                    Spacer()
                    
                    Button("Tag friends", systemImage: "person.fill") { }
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.blue)
                    
                    Spacer()
                    
                    Button("Add feeling", systemImage: "face.smiling") { }
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.yellow)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(.pin)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.red)
                    }
                    
                    Spacer()
                    
                    Button("More", systemImage: "ellipsis.circle.fill") { }
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.darkGray)
                    
                    Spacer()
                }
            }
            .toolbar { toolbar }
        }
        .onChange(of: selectedPhotoPickerItem) {
            Task {
                if let imageData = try? await selectedPhotoPickerItem?.loadTransferable(type: Data.self) {
                    selectedImageData = imageData
                }
            }
        }
        .photosPicker(isPresented: $isPhotosPickerShown, selection: $selectedPhotoPickerItem)
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            CustomBackButton()
            
            Text("Create Post")
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button("Post") {
                Task {
                    try await viewModel.uploadPost(text, imageData: selectedImageData)
                    text = ""
                    selectedImageData = nil
                    dismiss()
                }
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .buttonStyle(.borderedProminent)
            .disabled(text.isEmpty)
        }
    }
}

#Preview {
    CreatePostView(viewModel: FeedViewModel())
}
