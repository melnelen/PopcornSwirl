//
//  MovieListView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import SwiftUI

struct MovieListView: View {
    var category: String
    
    var body: some View {
        List(movies) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieRow(movie: movie)
            }
        }
        .navigationTitle(category)
    }
    
    // Placeholder for movies array
    private var movies: [Movie] {
        [Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
         Movie(title: "Example Movie 2", category: ["Latest"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date())]
    }
}

#Preview {
    MovieListView(category: "Latest")
}
