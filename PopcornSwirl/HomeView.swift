//
//  HomeView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import SwiftUI

struct HomeView: View {
    private var movieCategories: [String] = ["Latest", "Popular", "Award-Winnig", "Family-Friendly"]
    private var movies: [Movie] = [
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Award-Winnig"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date())
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                ForEach(movieCategories, id: \.self) { category in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: MovieListView(category: category)) {
                            Text(category)
                                .font(.title2)
                                .padding(.leading, 15)
                                .padding(.top, 20)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(movies, id: \.id) { movie in
                                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                                        MovieCardView(imageURL: movie.posterURL)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .frame(width: 150, height: 150)
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .frame(height: 170)
                    }
                }
            }
        }
        .navigationTitle("PopcornSwirl")
    }
}

#Preview {
    HomeView()
}
