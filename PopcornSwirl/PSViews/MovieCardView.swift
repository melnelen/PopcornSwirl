//
//  MovieCardView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct MovieCardView: View {
    var imageURL: URL?

    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Image("movie-placeholder") // Placeholder image
                .resizable()
                .scaledToFill()
        }
        .frame(width: 100, height: 150)
        .cornerRadius(10)
    }
}

#Preview {
    MovieCardView()
}
