//
//  WatchedView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 13/05/2024.
//

import SwiftUI

struct WatchedView: View {
    @ObservedObject private var watchedManager = WatchedManager.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(watchedManager.watchedMovies) { movie in
                    NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                        Text(movie.title)
                    }
                }
            }
            .navigationTitle("Watched")
        }
    }
}

#Preview {
    WatchedView()
}
