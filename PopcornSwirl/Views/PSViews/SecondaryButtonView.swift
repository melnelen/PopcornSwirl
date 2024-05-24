//
//  SecondaryButtonView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 17/05/2024.
//

import SwiftUI

struct SecondaryButtonView: View {
    var text: String
    
    var body: some View {
        Button(action: {
            // Watched action
        }) {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
                .padding(.horizontal, 40)
        }
        .padding(5)
    }
}

#Preview {
    SecondaryButtonView(text: "Mark as Watched")
}
