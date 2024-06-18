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
    
    var body: some View {
        List {
            if let movie = movieDetailViewModel.movie {
                MovieDetailImage(imageURL: movie.backdropURL)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                
                MovieDetailListView(movie: movie)
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
}

#Preview {
    MovieDetailView(movieId: Movie.stubbedMovie.id, movieTitle: "Bloodshot")
}
