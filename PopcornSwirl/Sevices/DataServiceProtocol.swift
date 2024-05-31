//
//  DataServiceProtocol.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 31/05/2024.
//

import Foundation

protocol DataServiceProtocol {
    var movies: [Movie]? { get }
    var movieCategories: [String]? { get }
    func fetchMovies()
}
