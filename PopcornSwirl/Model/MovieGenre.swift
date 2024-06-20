//
//  MovieGenre.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import Foundation

struct MovieGenre: Codable, Hashable, Equatable {
    static func == (lhs: MovieGenre, rhs: MovieGenre) -> Bool {
        lhs.name == rhs.name
    }
    let name: String
}
