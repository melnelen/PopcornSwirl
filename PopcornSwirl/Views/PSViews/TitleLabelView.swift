//
//  TitleLabelView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 13/05/2024.
//

import SwiftUI

struct TitleLabelView: View {
    var text = String()
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.accentColor)
            .padding(.leading, 15)
            .padding(.top, 20)
    }
}

#Preview {
    TitleLabelView(text: "Title")
}
