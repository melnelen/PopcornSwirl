//
//  HomeView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import SwiftUI

struct HomeView: View {
//    @State private var selectedCategory: String = "Latest"
    
    var body: some View {
        List {
            ForEach(movieCategories, id: \.self) { category in
                NavigationLink(destination: MovieListView(category: category)) {
                    Text(category)
                }
            }
        }
        .navigationTitle("PopcornSwirl")
    }
    
    private var movieCategories: [String] {
        ["Latest", "Action", "Drama", "Comedy", "Horror"]
    }
}

#Preview {
    HomeView()
}
