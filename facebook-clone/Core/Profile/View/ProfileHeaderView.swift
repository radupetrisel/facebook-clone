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
    
    @State private var showCoverImagePicker = false
    @State private var selectedCoverImage: PhotosPickerItem?
    
    let viewModel: FeedViewModel
    let width: CGFloat
    
    var user: User { viewModel.currentUser }
    
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            Button {
                showCoverImagePicker.toggle()
            } label: {
                AsyncImage(url: user.coverImageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 250)
                        .clipped()
                } placeholder: {
                    Image(.noProfile)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 250)
                }
            }
            
            Color.white
                .frame(height: 180)
        }
        .overlay {
            VStack(alignment: .leading) {
                Button {
                    showProfileImagePicker.toggle()
                } label: {
                    AsyncImage(url: user.profileImageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(.circle)
                            .overlay {
                                Circle()
                                    .stroke(Color(.systemGray6), lineWidth: 3)
                            }
                            .padding(.top, 170)
                        
                    } placeholder: {
                        Image(.noProfile)
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
                if let profileImageData = try? await selectedProfileImage?.loadTransferable(type: Data.self) {
                    if let url = try? await viewModel.updateImage(profileImageData, imagePath: "profileImageName") {
                        UserService.shared.currentUser?.profileImageURL = url
                    }
                }
            }
        }
        .onChange(of: selectedCoverImage) {
            Task { @MainActor in
                if let coverImageData = try? await selectedCoverImage?.loadTransferable(type: Data.self) {
                    if let url = try? await viewModel.updateImage(coverImageData, imagePath: "coverImageName") {
                        UserService.shared.currentUser?.coverImageURL = url
                    }
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
