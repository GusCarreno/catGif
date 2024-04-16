//
//  CatDetailView.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

/*struct CatDetailView: View {
  let catItem: CatItem

  var body: some View {
    ScrollView {
      VStack {
        // Hero Image with Placeholder and Error Handling
        ZStack(alignment: .top) {
          AsyncImage(url: URL(string: GlobalVariables.shared.detailUrlString + "/\(catItem.id)")!) { phase in
            switch phase {
            case .empty:
              ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity, maxHeight: 300) // Adjust max width
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 300)
                .cornerRadius(16)
                .shadow(radius: 8)
            case .failure:
              Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .frame(maxHeight: 300)
                .cornerRadius(16)
            @unknown default:
              EmptyView()
            }
          }
          .clipShape(RoundedRectangle(cornerRadius: 16))
          .padding(.top) // Add top padding
        }

        // Details Stack with Divider
        VStack(alignment: .leading, spacing: 12) {
          // Tags with Capsule Style
          Text(catItem.tags.joined(separator: ", "))
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.horizontal, 16)
            .background(
              Capsule()
                .fill(Color.gray.opacity(0.1))
                .overlay(
                  Capsule()
                    .stroke(Color.gray, lineWidth: 1)
                )
            )

          Divider() // Add divider line

          // Size Text
          Text("Size: \(catItem.formattedSize)")
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(.horizontal, 16)

          // ID Text with Stacked Layout
          HStack {
            Text("ID: ")
              .font(.caption)
              .fontWeight(.semibold)
              .foregroundColor(.secondary)
            Text(catItem.id)
              .font(.caption)
              .foregroundColor(.secondary)
          }
          .padding(.horizontal, 16)
        }
        .padding(.vertical, 16) // Add vertical padding for details stack

        Spacer()
      }
      .padding() // Add padding to scroll view
    }
    .navigationTitle("Cat Details")
    .background(Color.gray.opacity(0.05).ignoresSafeArea(.all)) // Subtle background color
  }
}*/
// CatDetailView.swift

struct CatDetailView: View {
    let catItem: CatItem
    @State private var isImagePopupVisible = false

    var body: some View {
        ScrollView {
            VStack {
                // Hero Image with Placeholder and Error Handling
                ZStack(alignment: .top) {
                    Button(action: {
                        isImagePopupVisible.toggle()
                    }) {
                        AsyncImage(url: URL(string: GlobalVariables.shared.detailUrlString + "/\(catItem.id)")!) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .frame(maxWidth: .infinity, maxHeight: 300) // Adjust max width
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxHeight: 300)
                                    .cornerRadius(16)
                                    .shadow(radius: 8)
                            case .failure:
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.red)
                                    .frame(maxHeight: 300)
                                    .cornerRadius(16)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.top) // Add top padding
                    .sheet(isPresented: $isImagePopupVisible) {
                        ImagePopupView(imageURL: URL(string: GlobalVariables.shared.detailUrlString + "/\(catItem.id)")!)
                    }
                }

                // Details Stack with Divider
                VStack(alignment: .leading, spacing: 12) {
                    // Tags with Capsule Style
                    Text(catItem.tags.joined(separator: ", "))
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 16)
                        .background(
                            Capsule()
                                .fill(Color.gray.opacity(0.1))
                                .overlay(
                                    Capsule()
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        )

                    Divider() // Add divider line

                    // Size Text
                    Text("Size: \(catItem.formattedSize)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 16)

                    // ID Text with Stacked Layout
                    HStack {
                        Text("ID: ")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Text(catItem.id)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 16) // Add vertical padding for details stack

                Spacer()
            }
            .padding() // Add padding to scroll view
        }
        .navigationTitle("Cat Details")
        .background(Color.gray.opacity(0.05).ignoresSafeArea(.all)) // Subtle background color
    }
}
