//
//  MovieCrew.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import Foundation

struct MovieCrew: Codable, Identifiable, Hashable, Equatable {
    static func == (lhs: MovieCrew, rhs: MovieCrew) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let job: String
    let name: String
}
