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
    @ObservedObject private var watchedManager = WatchedManager.shared
    
    private var randomAd: Ad {
            return ads.randomElement()!
        }
    
    var body: some View {
        ScrollView {
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
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                }
                .padding()
                
                Button(action: {
                    toggleWatched(movie: movie)
                }) {
                    Text(watchedManager.isWatched(movie: movie) ? "Mark as Unwatched" : "Mark as Watched")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                }
                .padding()
                
                AdView(ad: randomAd)
                    .padding()
            }
        }
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
    
    private func toggleWatched(movie: Movie) {
        if watchedManager.isWatched(movie: movie) {
            watchedManager.remove(movie: movie)
        } else {
            watchedManager.add(movie: movie)
        }
    }
}

#Preview {
    MovieDetailView(movieId: Movie.stubbedMovie.id, movieTitle: "Bloodshot")
}
