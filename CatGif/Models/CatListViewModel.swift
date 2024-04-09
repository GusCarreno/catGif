//
//  CatListViewModel.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

class CatListViewModel: ObservableObject {
  @Published var catItems: [CatItem] = []
  private let catService: CatService

  init(catService: CatService = RemoteCatService()) {
    self.catService = catService
  }

 func fetchCatList() async {
     do {
         let catItems = try await catService.fetchCatList(limit: 10, skip: 0)
         await MainActor.run { // Update on main thread
           self.catItems = catItems
         }
       } catch {
         // Handle errors gracefully, e.g., display an alert or log the error
         print("ERROR:\(error.localizedDescription)")
       }
   
  }
}
