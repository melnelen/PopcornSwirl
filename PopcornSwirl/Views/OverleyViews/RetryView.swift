//
//  RetryView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/06/2024.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try Again")
            }
        }
    }
}

#Preview {
    RetryView(text: "An Error occured") {
        print("Retry Tapped")
    }
}
