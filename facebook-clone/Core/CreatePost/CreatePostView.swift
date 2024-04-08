//
//  CreatePostView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 19.03.2024.
//

import SwiftUI

struct CreatePostView: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                
                HStack(alignment: .top) {
                    Image("profilePic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading) {
                        Text("Omar Thamri")
                        
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
                
                Spacer()
                
                Divider()
                
                HStack {
                    Spacer()
                    
                    Button("Add photo", systemImage: "photo.fill.on.rectangle.fill") { }
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
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            CustomBackButton()
            
            Text("Create Post")
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button("Post") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .buttonStyle(.borderedProminent)
            .disabled(text.isEmpty)
        }
    }
}

#Preview {
    CreatePostView()
}
