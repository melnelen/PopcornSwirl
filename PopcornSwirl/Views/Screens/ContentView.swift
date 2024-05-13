//
//  ContentView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Label("The Swirl", systemImage: "popcorn.fill")
                    }.tag(1)
                FavoritesView()
                    .tabItem {
                        Label("Favotites", systemImage: "star.fill")
                    }.tag(2)
                WatchedView()
                    .tabItem {
                        Label("Watched", systemImage: "eye.fill")
                    }.tag(3)
            }
        }
    }
}

#Preview {
    ContentView()
}
