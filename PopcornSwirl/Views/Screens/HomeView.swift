//
//  HomeView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeState = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(homeState.sections) {
                    MovieThumbnailCarouselView(
                        title: $0.title,
                        movies: $0.movies,
                        thumbnailType: $0.thumbnailType)
                }
                .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                .listRowSeparator(.hidden)
            }
            .task { loadMovies(invalidateCache: false) }
            .refreshable { loadMovies(invalidateCache: true) }
            .overlay(DataFetchPhaseOverlayView(
                phase: homeState.phase,
                retryAction: { loadMovies(invalidateCache: true) })
            )
            .navigationTitle("PopcornSwirl")
        }
    }
    
    @MainActor
    private func loadMovies(invalidateCache: Bool) {
        Task { await homeState.loadMoviesFromAllEndpoints(invalidateCache: invalidateCache) }
    }
}

#Preview {
    HomeView()
}
