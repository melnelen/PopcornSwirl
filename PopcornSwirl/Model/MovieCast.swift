//
//  MovieCast.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import Foundation

struct MovieCast: Codable, Identifiable, Hashable {
    let id: Int
    let character: String
    let name: String
}
