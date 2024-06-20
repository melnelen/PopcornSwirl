//
//  DataFetchPhaseOverlayView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/06/2024.
//

import SwiftUI

protocol EmptyData {
    var isEmpty: Bool { get }
}

struct DataFetchPhaseOverlayView<V: Equatable & EmptyData>: View {
    
    let phase: DataFetchPhase<V>
    let retryAction: () -> ()
    
    var body: some View {
        switch phase {
        case .empty:
            ProgressView()
        case .success(let value) where value.isEmpty:
            EmptyPlaceholderView(text: "No data", image: Image(systemName: "film"))
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: retryAction)
        default:
            EmptyView()
        }
    }
}

#Preview {
    Group {
        DataFetchPhaseOverlayView(phase: DataFetchPhase<[Movie]>.success([])) {
            print("Retry")
        }
        
        DataFetchPhaseOverlayView(phase: DataFetchPhase<[Movie]>.empty) {
            print("Retry")
        }
        
        DataFetchPhaseOverlayView(phase: DataFetchPhase<Movie?>.failure(MovieError.invalidResponse)) {
            print("Retry")
        }
    }
}

