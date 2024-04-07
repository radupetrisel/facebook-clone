//
//  ProfileHeaderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 17.03.2024.
//

import PhotosUI
import SwiftUI


struct ProfileHeaderView: View {
    @State private var showProfileImagePicker = false
    @State private var selectedProfileImage: PhotosPickerItem?
    @State private var profileImage: Image = .init(.noProfile)
    
    @State private var showCoverImagePicker = false
    @State private var selectedCoverImage: PhotosPickerItem?
    @State private var coverImage: Image = .init(.coverPicture)
    
    let viewModel: FeedViewModel
    let width: CGFloat
    
    var user: User { viewModel.currentUser }
    
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            Button {
                showCoverImagePicker.toggle()
            } label: {
                coverImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 250)
            }
            
            Color.white
                .frame(height: 180)
        }
        .overlay {
            VStack(alignment: .leading) {
                Button {
                    showProfileImagePicker.toggle()
                } label: {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(.circle)
                        .overlay {
                            Circle()
                                .stroke(Color(.systemGray6), lineWidth: 3)
                        }
                        .padding(.top, 170)
                }
                
                Text(user.fullName)
                    .font(.title)
                    .bold()
                
                Text("\(user.friendsIds.count) ")
                    .font(.headline)
                + Text("friends")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                HStack {
                    Button("Add to story", systemImage: "plus") {
                        
                    }
                    .buttonStyle(.profileHeader(background: .blue, foreground: .white))
                    
                    Button("Edit profile", systemImage: "pencil") {
                        
                    }
                    .buttonStyle(.profileHeader(background: .quaternary, foreground: .darkGray))
                    
                    Button("More", systemImage: "ellipsis") {
                        
                    }
                    .labelStyle(.iconOnly)
                    .buttonStyle(.profileHeader(background: .quaternary, foreground: .darkGray))
                }
                
                HStack {
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
        .onChange(of: selectedProfileImage) {
            Task { @MainActor in
                if let profileImage = try? await viewModel.loadImage(fromItem: selectedProfileImage) {
                    self.profileImage = Image(uiImage: profileImage)
                    try? await viewModel.updateImage(profileImage, imagePath: "profileImageName")
                }
            }
        }
        .onChange(of: selectedCoverImage) {
            Task { @MainActor in
                if let coverImage = try? await viewModel.loadImage(fromItem: selectedCoverImage) {
                    self.coverImage = Image(uiImage: coverImage)
                    try? await viewModel.updateImage(coverImage, imagePath: "coverImageName")
                }
            }
        }
        .photosPicker(isPresented: $showProfileImagePicker, selection: $selectedProfileImage)
        .photosPicker(isPresented: $showCoverImagePicker, selection: $selectedCoverImage)
    }
}

#Preview {
    GeometryReader { proxy in
        ProfileHeaderView(viewModel: FeedViewModel(), width: proxy.size.width)
    }
}
