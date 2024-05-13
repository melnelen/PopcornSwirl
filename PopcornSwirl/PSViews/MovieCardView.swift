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
                .scaledToFit()
        } placeholder: {
            Image("movie-placeholder") // Placeholder image
                .resizable()
                .scaledToFit()
        }
        .frame(width: 150, height: 150)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    MovieCardView()
}
