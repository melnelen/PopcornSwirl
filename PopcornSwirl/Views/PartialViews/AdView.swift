//
//  AdView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct AdView: View {
    let ad: Ad
    
    var body: some View {
        Link(destination: ad.url) {
            ZStack {
                Image(ad.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Text(ad.title)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                        
                        Text(ad.description)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing, .bottom], 10)
                    }
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                }
                .frame(height: 300)
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
    }
}

#Preview {
    AdView(ad: ads.randomElement()!)
}
