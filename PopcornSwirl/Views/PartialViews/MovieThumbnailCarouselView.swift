//
//  MovieThumbnailCarouselView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/06/2024.
//

import SwiftUI

struct MovieThumbnailCarouselView: View {
    let title: String
    let movies: [Movie]
    var thumbnailType: MovieThumbnailType = .poster()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                            MovieThumbnailView(movie: movie, thumbnailType: thumbnailType)
                                .movieThumbnailViewFrame(thumbnailType: thumbnailType)
                        }.buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
}

fileprivate extension View {
    @ViewBuilder
    func movieThumbnailViewFrame(thumbnailType: MovieThumbnailType) -> some View {
        switch thumbnailType {
        case .poster:
            self.frame(width: 204, height: 306)
        case .backdrop:
            self
                .aspectRatio(16/9, contentMode: .fit)
                .frame(height: 160)
        }
    }
}

#Preview {
    MovieThumbnailCarouselView(title: "Now Playing", movies: Movie.stubbedMovies, thumbnailType: .poster(showTitle: true))
        .previewLayout(.sizeThatFits)
}
