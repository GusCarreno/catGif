//
//  GlobalVariables.swift
//  CatGif
//
//  Created by Mr. G Carreño on 8/4/24.
//

import SwiftUI

class GlobalVariables: ObservableObject {
    
    static let shared = GlobalVariables()
    @Published var baseUrlString: String = "https://cataas.com/api/cats"
    @Published var detailUrlString: String = "https://cataas.com/cat"
    @Published var globalMessage: String = "Unable to parses"

    private init() {}
}
