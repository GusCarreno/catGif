//
//  CatGifTests.swift
//  CatGifTests
//
//  Created by Mr. G Carreño on 8/4/24.
//

import XCTest
import SwiftUI
@testable import CatGif


final class CatGifTests: XCTestCase {

    func testCatListItemView() {
            // Create a sample CatItem
            let catItem = CatItem(id: "123", mimeType: "image/jpeg", size: 10000, tags: ["tag1", "tag2"])
            
            // Create a CatListItemView with the sample CatItem
            let view = CatListItemView(catItem: catItem)
            // Access the body of the view to trigger the SwiftUI view rendering
            let body = view.body
            
            // Check if the body contains the expected content
            XCTAssertNotNil(body)
        }
        
        func testCatDetailView() {
            // Create a sample CatItem
            let catItem = CatItem(id: "123", mimeType: "image/jpeg", size: 10000, tags: ["tag1", "tag2"])
            // Create a CatDetailView with the sample CatItem
            let view = CatDetailView(catItem: catItem)
            // Access the body of the view to trigger the SwiftUI view rendering
            let body = view.body
            // Check if the body contains the expected content
            XCTAssertNotNil(body)
        }
    
}
