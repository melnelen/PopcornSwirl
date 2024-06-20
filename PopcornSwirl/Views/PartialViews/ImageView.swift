//
//  ImageView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import SwiftUI

struct ImageView: View {
    
    let movie: Movie
    var thumbnailType: MovieThumbnailType = .poster()
    @StateObject var movieThumbnailViewModel = MovieThumbnailViewModel()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            
            if case .poster(let showTitle) = thumbnailType, showTitle {
                Text(movie.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .lineLimit(4)
            }
            
            if let image = movieThumbnailViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .layoutPriority(-1)
            }
        }
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    ImageView(movie: Movie.stubbedMovie, thumbnailType: .poster(showTitle: true))
        .frame(width: 204, height: 306)
}
