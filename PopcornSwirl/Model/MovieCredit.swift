//
//  MovieCredit.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import Foundation

struct MovieCredit: Codable, Hashable, Equatable {
    static func == (lhs: MovieCredit, rhs: MovieCredit) -> Bool {
        lhs.cast == rhs.cast && lhs.crew == rhs.crew
    }
    
    let cast: [MovieCast]
    let crew: [MovieCrew]
}
