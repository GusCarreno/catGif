//
//  CatItem.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

struct CatItem: Identifiable, Decodable {
    let id: String
    let mimeType: String
    let size: Int
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case mimeType = "mimetype"
        case size
        case tags
    }
    
    var formattedSize: String {
      let formatter = ByteCountFormatter()
      formatter.countStyle = .file
      return formatter.string(fromByteCount: Int64(size))
    }
}
