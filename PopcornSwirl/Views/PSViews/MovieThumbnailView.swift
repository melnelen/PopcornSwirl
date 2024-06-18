//
//  MovieThumbnailView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 31/05/2024.
//

import SwiftUI

struct MovieThumbnailView: View {
    
    let movie: Movie
    var thumbnailType: MovieThumbnailType = .poster()
    @StateObject var movieThumbnailViewModel = MovieThumbnailViewModel()
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                ImageView(movie: movie, thumbnailType: thumbnailType, movieThumbnailViewModel: movieThumbnailViewModel)
                
                if favoritesManager.isFavorite(movie: movie) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(5)
                        .background(Color.black.opacity(0.7))
                        .clipShape(Circle())
                        .padding([.top, .trailing], 8)
                }
            }
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
        }
        .onAppear {
            switch thumbnailType {
            case .poster:
                movieThumbnailViewModel.loadImage(with: movie.posterURL)
            case .backdrop:
                movieThumbnailViewModel.loadImage(with: movie.backdropURL)
            }
        }
    }
}

#Preview {
    Group {
        MovieThumbnailView(movie: Movie.stubbedMovie, thumbnailType: .poster(showTitle: true))
            .frame(width: 204, height: 306)
        
        MovieThumbnailView(movie: Movie.stubbedMovie, thumbnailType: .backdrop)
            .aspectRatio(16/9, contentMode: .fit)
            .frame(height: 160)
    }
}
