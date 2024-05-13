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
                Text(movie.title).font(.title)
                TextField("Add a note...", text: $note)
                Button("Bookmark") {
                    // Bookmark action
                }
                Button("Mark as Watched") {
                    // Watched action
                }
                Spacer()
                AdView()
            }
            .padding()
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()))
}
