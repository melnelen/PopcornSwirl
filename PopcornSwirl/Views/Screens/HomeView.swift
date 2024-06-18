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
        ScrollView {
            ForEach(homeState.sections) { section in
                MovieThumbnailCarouselView(
                    title: section.title,
                    movies: section.movies,
                    thumbnailType: section.thumbnailType)
            }
            .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .task { await loadMovies(invalidateCache: false) }
        .refreshable { await loadMovies(invalidateCache: true) }
        .overlay(DataFetchPhaseOverlayView(
            phase: homeState.phase,
            retryAction: { Task { await loadMovies(invalidateCache: true) } })
        )
    }
    
    @MainActor
    private func loadMovies(invalidateCache: Bool) async {
        await homeState.loadMoviesFromAllEndpoints(invalidateCache: invalidateCache)
    }
}

#Preview {
    HomeView()
}
