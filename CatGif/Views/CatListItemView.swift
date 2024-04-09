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
    NavigationLink {
      CatDetailView(catItem: catItem)
    } label: {
      HStack {
        AsyncImage(url: URL(string: GlobalVariables.shared.detailUrlString + "/\(catItem.id)")!) { phase in
          switch phase {
          case .empty:
            ProgressView()
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 80, height: 80)
              .clipped() // Clip to avoid overflowing content
          case .failure(let error):
            Text(error.localizedDescription)
          @unknown default:
            Text(GlobalVariables.shared.globalMessage)
          }
        }

        Spacer()

        VStack(alignment: .leading) {
          Text(catItem.tags.joined(separator: ", "))
            .font(.body)
            .lineLimit(2)
          Text("\(catItem.formattedSize)")
            .font(.caption)
            .foregroundColor(.gray)
        }
      }
    }
  }
}
