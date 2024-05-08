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
    
    // Initialize with all properties
    init(id: UUID = UUID(), title: String, category: [String]) {
        self.id = id
        self.title = title
        self.category = category
    }
}
