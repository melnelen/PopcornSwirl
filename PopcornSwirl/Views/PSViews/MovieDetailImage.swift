//
//  MovieDetailImage.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import SwiftUI

struct MovieDetailImage: View {
    
    @StateObject private var imageLoader = MovieThumbnailViewModel()
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear { imageLoader.loadImage(with: imageURL) }
    }
}

#Preview {
    MovieDetailImage(imageURL: URL(string: "https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg")!)
}
