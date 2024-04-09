//
//  CatDetailView.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

struct CatDetailView: View {
    let catItem: CatItem

    var body: some View {
      ScrollView { // Allow scrolling for potentially long content
        VStack(alignment: .leading) {
          AsyncImage(url: URL(string: GlobalVariables.shared.detailUrlString + "/\(catItem.id)")!) { phase in
            switch phase {
            case .empty:
              ProgressView()
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea(edges: .top) // Allow image to fill top space
            case .failure(let error):
              Text(error.localizedDescription)
            @unknown default:
              Text(GlobalVariables.shared.globalMessage)
            }
          }
          .frame(maxHeight: 400) // Set a maximum height for the image
          .accessibilityElement(children: .combine) // Make image accessible

          Text(catItem.tags.joined(separator: ", "))
            .font(.title2)
            .padding(.top)
            .accessibilityElement(children: .combine) // Make tags text accessible

          Text("Size: \(catItem.formattedSize)")
            .font(.footnote)
            .foregroundColor(.gray)
            .accessibilityElement(children: .combine) // Make size text accessible

          HStack {
            Text("ID: ")
              .font(.footnote)
              .foregroundColor(.gray)
              .accessibilityElement(children: .combine) // Make ID label accessible
            Text(catItem.id)
              .font(.body)
              .accessibilityElement(children: .combine) // Make ID value accessible
          }
          .padding(.top)

          Spacer() // Add some space at the bottom
        }
        .padding() // Add padding for aesthetics
        .accessibilityElement(children: .combine) // Make entire VStack accessible
      }
      .navigationTitle("Cat Details") // Set navigation title
      .accessibilityElement(children: .combine)
    }
  }
