//
//  HomeViewModel.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 31/05/2024.
//

import Foundation

class HomeViewModel {
    @Published var movies: [Movie]?
    @Published var movieCategories: [String]?
    
    private let dataService: DataServiceProtocol
    
    init( dataService: DataServiceProtocol = MockDataService()) {
        self.dataService = dataService
        self.movies = dataService.movies
        self.movieCategories = dataService.movieCategories
    }
    
    func fetchMovies() -> [Movie]? {
        dataService.fetchMovies()
        movies = dataService.movies
        return movies
    }

}

