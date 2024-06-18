//
//  movieDescriptionSection.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import SwiftUI

struct movieDescriptionSection: View {
    
    let movie: Movie
    private var movieGenreYearDurationText: String {
        "\(movie.genreText) · \(movie.yearText) · \(movie.durationText)"
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            Text(movieGenreYearDurationText)
                .font(.headline)
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    movieDescriptionSection(movie: Movie.stubbedMovie)
        .previewLayout(.sizeThatFits)
        .padding()
}
