//
//  MovieCrew.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 18/06/2024.
//

import Foundation

struct MovieCrew: Codable, Identifiable, Hashable {
    let id: Int
    let job: String
    let name: String
}
