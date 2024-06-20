//
//  FavoritesManagerTests.swift
//  PopcornSwirlTests
//
//  Created by Alexandra Ivanova on 21/06/2024.
//

import XCTest
import Combine
@testable import PopcornSwirl

class FavoritesManagerTests: XCTestCase {
    
    var favoritesManager: FavoritesManager!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        favoritesManager = FavoritesManager.shared
        cancellables = Set<AnyCancellable>()
        UserDefaults.standard.removeObject(forKey: favoritesManager.favoritesKey)
        favoritesManager.favoriteMovies = []
    }
    
    override func tearDown() {
        favoritesManager = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testAddMovie() {
        let movie = Movie.stubbedMovie
        let expectation = self.expectation(description: "Movie added to favorites")
        
        favoritesManager.$favoriteMovies
            .dropFirst()
            .sink { favoriteMovies in
                XCTAssertTrue(favoriteMovies.contains(movie))
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        favoritesManager.add(movie: movie)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRemoveMovie() {
        let movie = Movie.stubbedMovie
        favoritesManager.add(movie: movie)
        let expectation = self.expectation(description: "Movie removed from favorites")
        
        favoritesManager.$favoriteMovies
            .dropFirst()
            .sink { favoriteMovies in
                XCTAssertFalse(favoriteMovies.contains(movie))
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        favoritesManager.remove(movie: movie)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testIsFavorite() {
        let movie = Movie.stubbedMovie
        favoritesManager.add(movie: movie)
        
        XCTAssertTrue(favoritesManager.isFavorite(movie: movie))
        
        favoritesManager.remove(movie: movie)
        
        XCTAssertFalse(favoritesManager.isFavorite(movie: movie))
    }
    
    func testSaveFavorites() {
        let movie = Movie.stubbedMovie
        favoritesManager.add(movie: movie)
        
        let data = UserDefaults.standard.data(forKey: favoritesManager.favoritesKey)
        XCTAssertNotNil(data)
        
        let decodedMovies = try? JSONDecoder().decode([Movie].self, from: data!)
        XCTAssertEqual(decodedMovies?.count, 1)
        XCTAssertEqual(decodedMovies?.first?.id, movie.id)
    }
    
    func testLoadFavorites() {
        let movie = Movie.stubbedMovie
        let encodedData = try! JSONEncoder().encode([movie])
        UserDefaults.standard.set(encodedData, forKey: favoritesManager.favoritesKey)
        
        favoritesManager.loadFavorites()
        
        XCTAssertTrue(favoritesManager.favoriteMovies.contains(movie))
    }
}
