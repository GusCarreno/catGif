//
//  ContentView.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject var catListViewModel = CatListViewModel()

  var body: some View {
    NavigationView {
      List(catListViewModel.catItems) { catItem in
        CatListItemView(catItem: catItem)
      }
      .navigationTitle("Cat List")
      .onAppear {
        Task {
          await catListViewModel.fetchCatList()
        }
      }
    }
  }
}
