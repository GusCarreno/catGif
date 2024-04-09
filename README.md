# catGif
This project provides a basic structure for displaying a list of cat items with details and image loading functionalities. It includes unit tests for the CatService protocol and UI tests for CatListItemView. 

# Project Structure:
-CatItem.swift: Defines a struct representing a cat item with properties like ID, mimeType, size, and tags.
-CatService.swift: Defines a protocol for fetching cat list and details.
-RemoteCatService.swift: Implements CatService by fetching data from a remote server using URLSession.
-CatListItemView: A SwiftUI view representing a single cat list item with image, tags, and size information. Navigation to a detail view is triggered on tap.
-CatGifUITests : XCTestCase with UI tests for CatListItemView. (Optional: Add tests for loading indicators and error handling)
-CatLisViewModel May contain additional models related to cat details if needed.


#Testing:

Unit tests in CatServiceTests.swift verify the behavior of CatService and its mock implementation.
UI tests in CatGifUITests.swift simulate user interaction with CatListItemView and check navigation and basic functionality.

#Requirements:
Xcode 11 or later (for continueAfterLaunch method in UI tests)
Swift 5 or later
Connection internet

#Getting Started:
Clone this repository.
Open the project in Xcode.
Replace YourAppName with your actual app's module name in relevant places (Swift files and comments).
Configure connection details (URLs, API keys) in RemoteCatService.swift if necessary.
Run unit and UI tests to verify functionality.
Customize and extend the codebase to integrate with your specific app architecture and UI.

#ToDo
-Validation is connection is Lost
-More UniteTest and UITest
