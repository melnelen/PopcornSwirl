//
//  MockMovieService.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 20/06/2024.
//

import Foundation

class MockMovieService: MovieService {
    var fetchMoviesResult: Result<[Movie], Error> = .success(Movie.stubbedMovies)
    
    func fetchMovies(from endpoint: MovieListEndpoint) async throws -> [Movie] {
        switch fetchMoviesResult {
        case .success(let movies):
            return movies
        case .failure(let error):
            throw error
        }
    }
    
    func fetchMovie(id: Int) async throws -> Movie {
        throw MovieError.apiError 
    }
}
