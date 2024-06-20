//
//  WatchedView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 13/05/2024.
//

import SwiftUI

struct WatchedView: View {
    @ObservedObject private var watchedManager = WatchedManager.shared
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(watchedManager.watchedMovies) { movie in
                    NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                        MovieThumbnailView(movie: movie, thumbnailType: .poster(showTitle: false))
                            .frame(height: 200)
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    WatchedView()
}
