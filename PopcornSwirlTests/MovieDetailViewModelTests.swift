//
//  MovieDetailViewModelTests.swift
//  PopcornSwirlTests
//
//  Created by Alexandra Ivanova on 20/06/2024.
//

import XCTest
@testable import PopcornSwirl

class MovieDetailViewModelTests: XCTestCase {

    var viewModel: MovieDetailViewModel!
    var mockMovieService: MockMovieService!

    @MainActor
    override func setUp() {
        super.setUp()
        mockMovieService = MockMovieService()
        viewModel = MovieDetailViewModel(movieService: mockMovieService)
    }

    override func tearDown() {
        viewModel = nil
        mockMovieService = nil
        super.tearDown()
    }

    @MainActor
    func testLoadMovieSuccess() async {
        let expectedMovie = Movie.stubbedMovie
        mockMovieService.movie = expectedMovie

        await viewModel.loadMovie(id: expectedMovie.id)

        XCTAssertEqual(viewModel.movie, expectedMovie)
        if case .success(let movie) = viewModel.phase {
            XCTAssertEqual(movie, expectedMovie)
        } else {
            XCTFail("Expected phase to be success with the movie")
        }
    }

    @MainActor
    func testLoadMovieFailure() async {
        let expectedError = MovieError.apiError
        mockMovieService.error = expectedError

        await viewModel.loadMovie(id: 1)

        if case .failure(let error) = viewModel.phase {
            XCTAssertEqual(error.localizedDescription, expectedError.localizedDescription)
        } else {
            XCTFail("Expected phase to be failure with the error")
        }
    }

    @MainActor
    func testLoadMovieCancellation() async {
        let task = Task {
            await viewModel.loadMovie(id: 1)
        }
        task.cancel()

        await Task.yield()

        XCTAssertNil(viewModel.movie)
        if case .empty = viewModel.phase {
            XCTAssertTrue(true)
        } else {
            XCTFail("Expected phase to be empty")
        }
    }
}
