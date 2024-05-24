//
//  MoviesCarouselView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 13/05/2024.
//

import SwiftUI

struct MoviesCarouselView: View {
    var movies: [Movie] 
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(movies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieCardView(imageURL: movie.posterURL)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.leading, 15)
        }
    }
}

#Preview {
    MoviesCarouselView(movies: [
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Award-Winnig"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date())
    ])
}
