//
//  Movie.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 06/05/2024.
//

import Foundation
import SwiftData

@Model
final class Movie: Identifiable {
    let id: UUID
    var title: String
    var category: [String]
    var genres: [String]
    var info: String
    var posterURL: URL
    var releaseDate: Date
    
    
    
    // Initialize with all properties
    init(id: UUID = UUID(), title: String, category: [String], genres: [String], info: String, posterURL: URL, releaseDate: Date) {
        self.id = id
        self.title = title
        self.category = category
        self.genres = genres
        self.info = info
        self.posterURL = posterURL
        self.releaseDate = releaseDate
    }
}
