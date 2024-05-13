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
        Movie(title: "Example Movie 3", category: ["Award-Winnig"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Award-Winnig"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 1", category: ["Latest"], genres: ["Action"], info: "A great action movie.", posterURL: URL(string: "https://example.com/movie1.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 2", category: ["Popular"], genres: ["Comedy"], info: "A hilarious comedy.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date()),
        Movie(title: "Example Movie 3", category: ["Family-Friendly"], genres: ["Drama"], info: "A sad drama.", posterURL: URL(string: "https://example.com/movie2.jpg")!, releaseDate: Date())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                    ForEach(movieCategories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: MovieListView(category: category)) {
                                TitleLabelView(text: category)
                            }
                            
                            MoviesCarouselView(movies: movies.filter { $0.category.contains(category) })
                        }
                    }
                }
            }
            .navigationTitle("PopcornSwirl")
        }
    }
}

#Preview {
    HomeView()
}
