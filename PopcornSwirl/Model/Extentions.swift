//
//  Extentions.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 31/05/2024.
//

import SwiftUI

extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
    
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}

extension MovieSection {
    
    static var stubs: [MovieSection] {
        
        let stubbedMovies = Movie.stubbedMovies
        return MovieListEndpoint.allCases.map {
            MovieSection(movies: stubbedMovies.shuffled(), endpoint: $0)
        }
    }
    
}

extension URL: Identifiable {
    public var id: Self { self }
}

extension Array: EmptyData {}

extension Optional: EmptyData {
    
    var isEmpty: Bool {
        if case .none = self {
            return true
        }
        return false
    }
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
