//
//  FavoritesView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 13/05/2024.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesManager.favoriteMovies) { movie in
                    NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                        Text(movie.title)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
