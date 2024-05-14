//
//  MovieSummaryView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 14/05/2024.
//

import SwiftUI

struct MovieSummaryView: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movie.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("Release Date: \(movie.releaseDate)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Genres: \(movie.genres)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.leading, 5)
    }
}

#Preview {
    MovieSummaryView(movie: Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()))
}
