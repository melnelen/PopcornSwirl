//
//  PrimaryButtonView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 17/05/2024.
//

import SwiftUI

struct PrimaryButtonView: View {
    var text: String
    
    var body: some View {
        Button(action: {
            // Bookmark action
        }) {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(25)
                .padding(.horizontal, 40)
        }
        .padding(5)
    }
}

#Preview {
    PrimaryButtonView(text: "Favorite")
}
