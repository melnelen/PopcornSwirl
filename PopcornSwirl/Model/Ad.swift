//
//  AdViewModel.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 19/06/2024.
//

import SwiftUI

struct Ad: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

let ads: [Ad] = [
    Ad(title: "Movie Poster Collection", description: "Get exclusive movie posters for your collection.", imageName: "poster"),
    Ad(title: "Streaming Service", description: "Subscribe now to get unlimited access to movies.", imageName: "streaming"),
    Ad(title: "Movie Merchandise", description: "Find the best merchandise for your favorite movies.", imageName: "merchandise"),
    Ad(title: "Home Theater Setup", description: "Upgrade your home theater with the best equipment.", imageName: "theater"),
    Ad(title: "Film Festival Tickets", description: "Get tickets to the best film festivals around the world.", imageName: "festival")
]
