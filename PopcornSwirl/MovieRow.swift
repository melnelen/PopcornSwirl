//
//  MovieRow.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            Text(movie.title)
            Spacer()
            Button(action: {
                // Bookmark action
            }) {
                Image(systemName: "bookmark")
            }
            Button(action: {
                // Watched action
            }) {
                Image(systemName: "eye")
            }
        }
        .padding()
    }
}

#Preview {
    MovieRow(movie: Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()))
}
