//
//  CatListItemView.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

struct CatListItemView: View {
    let catItem: CatItem
    
    var body: some View {
            NavigationLink(destination: CatDetailView(catItem: catItem)) {
                HStack(spacing: 16) {
                    CatImageView(catItem: catItem)
                    CatItemDescriptionView(catItem: catItem)
                        .padding(.trailing, 5) // Adjust spacing
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)) // Add padding
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.3), radius: 6, x: 0, y: 2) // Add shadow
                .buttonStyle(PlainButtonStyle()) // Remove default button styling
            }
            .background(Color.clear) // Set the background color of the NavigationLink to clear
        }
}

struct CatImageView: View {
    let catItem: CatItem

    var body: some View {
        AsyncImage(url: URL(string: GlobalVariables.shared.detailUrlString + "/\(catItem.id)")!) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80) // Maintain aspect ratio
                    .clipShape(Circle())
                    .shadow(radius: 4)
            case .failure(_):
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                    .frame(width: 80, height: 80)
            @unknown default:
                Text(GlobalVariables.shared.globalMessage)
            }
        }
    }
}

struct CatItemDescriptionView: View {
    let catItem: CatItem

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(catItem.tags.joined(separator: ", "))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)

                Text("\(catItem.formattedSize)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer() // Pushes the text to the leading edge
        }
    }
}
