//
//  MovieCardView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct MovieCardView: View {
    var body: some View {
        Image(systemName: "bookmark")
            .frame(width: 150, height: 150)
            .background(Color.gray)
            .cornerRadius(20)
    }
}

#Preview {
    MovieCardView()
}
