//
//  MovieDetailView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieId: Int
    let movieTitle: String
    @StateObject private var movieDetailViewModel = MovieDetailViewModel()
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    
    var body: some View {
        List {
            if let movie = movieDetailViewModel.movie {
                MovieDetailImage(imageURL: movie.backdropURL)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                
                MovieDetailListView(movie: movie)
                
                Button(action: {
                    toggleFavorite(movie: movie)
                }) {
                    Text(favoritesManager.isFavorite(movie: movie) ? "Remove from Favorites" : "Add to Favorites")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .listStyle(.plain)
        .task {
            await loadMovie()
        }
        .overlay(DataFetchPhaseOverlayView(
            phase: movieDetailViewModel.phase,
            retryAction: {
                Task {
                    await loadMovie()
                }
            }
        ))
        .navigationTitle(movieTitle)
    }
    
    @MainActor
    private func loadMovie() async {
        await self.movieDetailViewModel.loadMovie(id: self.movieId)
    }
    
    private func toggleFavorite(movie: Movie) {
        if favoritesManager.isFavorite(movie: movie) {
            favoritesManager.remove(movie: movie)
        } else {
            favoritesManager.add(movie: movie)
        }
    }
}

#Preview {
    MovieDetailView(movieId: Movie.stubbedMovie.id, movieTitle: "Bloodshot")
}
