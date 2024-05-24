//
//  MovieRowView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct MovieRowView: View {
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            MovieCardView(imageURL: movie.posterURL)
            
            MovieSummaryView(movie: movie)
        }
        .padding(.leading, 10)
        .padding(.top, 10)
    }
}

#Preview {
    MovieRowView(movie: Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()))
}
