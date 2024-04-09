//
//  CatServiceTests.swift
//  CatGifTests
//
//  Created by Mr. G Carreño on 8/4/24.
//

import XCTest
import Combine
@testable import CatGif


class CatServiceTests: XCTestCase {
    
    func testFetchCatList() async throws {
            // Prepare a mock response data
            let jsonData = """
            [
                {
                    "_id": "123",
                    "mimetype": "image/jpeg",
                    "size": 10000,
                    "tags": ["tag1", "tag2"]
                },
                {
                    "_id": "456",
                    "mimetype": "image/jpeg",
                    "size": 20000,
                    "tags": ["tag3", "tag4"]
                }
            ]
            """.data(using: .utf8)!
            
            // Mock URLSession.shared.data to return the mock response data
            let url = URL(string: "https://cataas.com/api/cats?limit=10&skip=0")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Create an instance of RemoteCatService
            let catService: CatService = RemoteCatService()
            
            // Call the fetchCatList method
            do {
                let catItems = try await catService.fetchCatList(limit: 10, skip: 0)
                
                // Assert that the returned array is not empty
                XCTAssertFalse(catItems.isEmpty)
            } catch {
                XCTFail("Failed to fetch cat list with error: \(error)")
            }
        }
    }
