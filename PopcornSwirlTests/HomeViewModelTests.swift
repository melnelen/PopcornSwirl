//
//  HomeViewModelTests.swift
//  PopcornSwirlTests
//
//  Created by Alexandra Ivanova on 20/06/2024.
//

import XCTest
@testable import PopcornSwirl

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockMovieService: MockMovieService!
    
    @MainActor
    override func setUp() {
        super.setUp()
        mockMovieService = MockMovieService()
        viewModel = HomeViewModel(movieService: mockMovieService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockMovieService = nil
        super.tearDown()
    }
    
    @MainActor
    func testInitialState() {
        XCTAssertEqual(viewModel.phase, .empty)
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
    
    @MainActor
    func testLoadMoviesSuccess() async {
        // Given
        mockMovieService.fetchMoviesResult = .success(Movie.stubbedMovies)
        
        // When
        await viewModel.loadMoviesFromAllEndpoints(invalidateCache: true)
        
        // Then
        XCTAssertEqual(viewModel.sections.count, 4)
        XCTAssertEqual(viewModel.sections.first?.movies.first?.title, "Bloodshot")
    }
    
    @MainActor
    func testLoadMoviesFailure() async {
        // Given
        let error = MovieError.apiError
        mockMovieService.fetchMoviesResult = .failure(error)
        
        // When
        await viewModel.loadMoviesFromAllEndpoints(invalidateCache: true)
        
        // Then
        XCTAssertEqual(viewModel.phase, .failure(error))
    }
    
    @MainActor
    func testLoadMoviesFromCache() async {
        // Given
        mockMovieService.fetchMoviesResult = .success(Movie.stubbedMovies)
        
        // Load movies initially
        await viewModel.loadMoviesFromAllEndpoints(invalidateCache: true)
        
        // Change the result to an empty list
        mockMovieService.fetchMoviesResult = .success([])
        
        // When
        await viewModel.loadMoviesFromAllEndpoints(invalidateCache: false)
        
        // Then
        XCTAssertEqual(viewModel.sections.count, 4)
        XCTAssertEqual(viewModel.sections.first?.movies.first?.title, "Bloodshot")
    }
    
    @MainActor
        func testLoadMoviesInvalidCache() async {
            // Given
            mockMovieService.fetchMoviesResult = .success(Movie.stubbedMovies)
            
            // Load movies initially
            await viewModel.loadMoviesFromAllEndpoints(invalidateCache: true)
            
            // Change the result to a new set of movies
            let newMovies = [Movie.stubbedMovie]
            mockMovieService.fetchMoviesResult = .success(newMovies)
            
            // When
            await viewModel.loadMoviesFromAllEndpoints(invalidateCache: true)
            
            // Then
            XCTAssertEqual(viewModel.sections.count, 4)
            XCTAssertEqual(viewModel.sections.first?.movies.first?.title, "Bloodshot")
        }
        
        @MainActor
        func testFetchMoviesFromEndpoints() async throws {
            // Given
            mockMovieService.fetchMoviesResult = .success(Movie.stubbedMovies)
            
            // When
            let sections = try await viewModel.fetchMoviesFromEndpoints([.nowPlaying, .upcoming])
            
            // Then
            XCTAssertEqual(sections.count, 2)
            XCTAssertEqual(sections.first?.movies.count, Movie.stubbedMovies.count)
        }
    }

    extension MovieSection {
        static func fromMovies(_ movies: [Movie]) -> [MovieSection] {
            return MovieListEndpoint.allCases.map { endpoint in
                MovieSection(movies: movies, endpoint: endpoint)
            }
        }
}
