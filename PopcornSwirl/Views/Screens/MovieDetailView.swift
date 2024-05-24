//
//  MovieDetailView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    @State private var note: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MovieRowView(movie: movie)
                
                Text(movie.info).padding()
                
                TextField("Add a note...", text: $note).padding()
                
                PrimaryButtonView(text: "Favorite")
                
                SecondaryButtonView(text: "Mark as Watched")
                
                AdView()
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()))
}
