//
//  FavoritesManager.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import SwiftUI
import Combine

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()
    
    @Published private(set) var favoriteMovies: [Movie] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    private let favoritesKey = "favoriteMovies"
    
    private init() {
        loadFavorites()
    }
    
    func add(movie: Movie) {
        if !favoriteMovies.contains(movie) {
            favoriteMovies.append(movie)
        }
    }
    
    func remove(movie: Movie) {
        favoriteMovies.removeAll { $0.id == movie.id }
    }
    
    func isFavorite(movie: Movie) -> Bool {
        favoriteMovies.contains(movie)
    }
    
    private func saveFavorites() {
        do {
            let encodedData = try JSONEncoder().encode(favoriteMovies)
            UserDefaults.standard.set(encodedData, forKey: favoritesKey)
        } catch {
            print("Failed to encode favorite movies: \(error)")
        }
    }
    
    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else {
            return
        }
        
        do {
            favoriteMovies = try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            print("Failed to decode favorite movies: \(error)")
        }
    }
}
