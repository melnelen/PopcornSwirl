//
//  MovieDetailListView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import SwiftUI

struct MovieDetailListView: View {
    
    let movie: Movie
    
    var body: some View {
        movieDescriptionSection(movie: movie)
            .padding()
        movieCastSection(movie: movie)
            .padding()
    }
    
}

#Preview {
    MovieDetailListView(movie: Movie.stubbedMovies[0])
}
