//
//  MovieSelection.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 31/05/2024.
//

import Foundation

struct MovieSection: Identifiable {
    
    let id = UUID()
    
    let movies: [Movie]
    let endpoint: MovieListEndpoint
    var title: String {
        endpoint.description
    }
    
    var thumbnailType: MovieThumbnailType {
        endpoint.thumbnailType
    }
}

fileprivate extension MovieListEndpoint {
    
    var thumbnailType: MovieThumbnailType {
        switch self {
        case .nowPlaying:
            return .poster()
        default:
            return .backdrop
        }
    }
    
}
