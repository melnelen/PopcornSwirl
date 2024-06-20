//
//  WatchedManagerTests.swift
//  PopcornSwirlTests
//
//  Created by Alexandra Ivanova on 21/06/2024.
//

import XCTest
import Combine
@testable import PopcornSwirl

class WatchedManagerTests: XCTestCase {
    
    var watchedManager: WatchedManager!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        watchedManager = WatchedManager.shared
        cancellables = Set<AnyCancellable>()
        UserDefaults.standard.removeObject(forKey: watchedManager.watchedKey)
        watchedManager.watchedMovies = []
    }
    
    override func tearDown() {
        watchedManager = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testAddMovie() {
        let movie = Movie.stubbedMovie
        let expectation = self.expectation(description: "Movie added to watched list")
        
        watchedManager.$watchedMovies
            .dropFirst()
            .sink { watchedMovies in
                XCTAssertTrue(watchedMovies.contains(movie))
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        watchedManager.add(movie: movie)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRemoveMovie() {
        let movie = Movie.stubbedMovie
        watchedManager.add(movie: movie)
        let expectation = self.expectation(description: "Movie removed from watched list")
        
        watchedManager.$watchedMovies
            .dropFirst()
            .sink { watchedMovies in
                XCTAssertFalse(watchedMovies.contains(movie))
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        watchedManager.remove(movie: movie)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testIsWatched() {
        let movie = Movie.stubbedMovie
        watchedManager.add(movie: movie)
        
        XCTAssertTrue(watchedManager.isWatched(movie: movie))
        
        watchedManager.remove(movie: movie)
        
        XCTAssertFalse(watchedManager.isWatched(movie: movie))
    }
    
    func testSaveWatchedMovies() {
        let movie = Movie.stubbedMovie
        watchedManager.add(movie: movie)
        
        let data = UserDefaults.standard.data(forKey: watchedManager.watchedKey)
        XCTAssertNotNil(data)
        
        let decodedMovies = try? JSONDecoder().decode([Movie].self, from: data!)
        XCTAssertEqual(decodedMovies?.count, 1)
        XCTAssertEqual(decodedMovies?.first?.id, movie.id)
    }
    
    func testLoadWatchedMovies() {
        let movie = Movie.stubbedMovie
        let encodedData = try! JSONEncoder().encode([movie])
        UserDefaults.standard.set(encodedData, forKey: watchedManager.watchedKey)
        
        watchedManager.loadWatchedMovies()
        
        XCTAssertTrue(watchedManager.watchedMovies.contains(movie))
    }
}
