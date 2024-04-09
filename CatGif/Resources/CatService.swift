//
//  CatService.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import Foundation
import SwiftUI

protocol CatService {
  func fetchCatList(limit: Int, skip: Int) async throws -> [CatItem]
  func fetchCatDetails(id: String) async throws -> CatItem
}

class RemoteCatService: CatService {
    private let baseUrlString = GlobalVariables.shared.baseUrlString

    func fetchCatList(limit: Int, skip: Int) async throws -> [CatItem] {
        let urlString = "\(baseUrlString)?limit=\(limit)&skip=\(skip)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        do {
           let (data, _) = try await URLSession.shared.data(from: url)
           return try JSONDecoder().decode([CatItem].self, from: data)
         } catch {
           //hrow error // Re-throw the error for handling in the view model
           // OR
            return [] // Return an empty array in case of error
         }
    }
    
  func fetchCatDetails(id: String) async throws -> CatItem {
    let urlString = "\(baseUrlString)/\(id)"
    guard let url = URL(string: urlString) else {
        throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(CatItem.self, from: data)
  }
}
