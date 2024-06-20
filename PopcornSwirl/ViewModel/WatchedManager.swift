//
//  WatchedManager.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 19/06/2024.
//

import SwiftUI
import Combine

class WatchedManager: ObservableObject {
    static let shared = WatchedManager()
    
    @Published var watchedMovies: [Movie] = [] {
        didSet {
            saveWatchedMovies()
        }
    }
    
    let watchedKey = "watchedMovies"
    
    private init() {
        loadWatchedMovies()
    }
    
    func add(movie: Movie) {
        if !watchedMovies.contains(movie) {
            watchedMovies.append(movie)
        }
    }
    
    func remove(movie: Movie) {
        watchedMovies.removeAll { $0.id == movie.id }
    }
    
    func isWatched(movie: Movie) -> Bool {
        watchedMovies.contains(movie)
    }
    
    func saveWatchedMovies() {
        do {
            let encodedData = try JSONEncoder().encode(watchedMovies)
            UserDefaults.standard.set(encodedData, forKey: watchedKey)
        } catch {
            print("Failed to encode watched movies: \(error)")
        }
    }
    
    func loadWatchedMovies() {
        guard let data = UserDefaults.standard.data(forKey: watchedKey) else {
            return
        }
        
        do {
            watchedMovies = try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            print("Failed to decode watched movies: \(error)")
        }
    }
}
