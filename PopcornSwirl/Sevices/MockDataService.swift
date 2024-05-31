//
//  MockDataService.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 31/05/2024.
//

import Foundation

class MockDataService: DataServiceProtocol {    
    @Published var movies: [Movie]? = [
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Award-Winnig"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Award-Winnig"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Family-Friendly"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date())
    ]
    @Published var movieCategories: [String]? = ["Latest", "Popular", "Award-Winnig", "Family-Friendly"]
    
    
    func fetchMovies() {
        print("Movies ftched")
    }
}
