//
//  MovieCast.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import Foundation

struct MovieCast: Codable, Identifiable, Hashable, Equatable {
    static func == (lhs: MovieCast, rhs: MovieCast) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let character: String
    let name: String
}
