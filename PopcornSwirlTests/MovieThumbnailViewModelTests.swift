//
//  MovieThumbnailViewModelTests.swift
//  PopcornSwirlTests
//
//  Created by Alexandra Ivanova on 20/06/2024.
//

import XCTest
import SwiftUI
@testable import PopcornSwirl

class MovieThumbnailViewModelTests: XCTestCase {

    var viewModel: MovieThumbnailViewModel!
    var url: URL!
    var mockURLSession: MockURLSession!

    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        viewModel = MovieThumbnailViewModel(urlSession: mockURLSession)
        url = URL(string: "https://example.com/image.jpg")!
    }

    override func tearDown() {
        viewModel = nil
        url = nil
        mockURLSession = nil
        super.tearDown()
    }

    func testLoadImageSuccess() {
        let expectation = self.expectation(description: "Image loaded")
        let imageData = UIImage(systemName: "star")!.pngData()!
        mockURLSession.data = imageData

        viewModel.loadImage(with: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertNotNil(self.viewModel.image)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testLoadImageFromCache() {
        let cachedImage = UIImage(systemName: "star")!
        viewModel.imageCache.setObject(cachedImage, forKey: url.absoluteString as AnyObject)

        viewModel.loadImage(with: url)

        XCTAssertEqual(viewModel.image, cachedImage)
    }

    func testLoadImageError() {
        let expectation = self.expectation(description: "Image loading failed")
        mockURLSession.error = NSError(domain: "com.example", code: 404, userInfo: nil)

        viewModel.loadImage(with: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertNil(self.viewModel.image)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 3, handler: nil)
    }
}
