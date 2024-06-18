//
//  ContentView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @State private var homeNavigationStack = NavigationPath()
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack(path: $homeNavigationStack) {
                HomeView()
                    .navigationTitle("PopcornSwirl")
                    .onChange(of: selection) {
                        homeNavigationStack.removeLast(homeNavigationStack.count)
                    }
            }
            .tabItem {
                Label("The Swirl", systemImage: "popcorn.fill")
            }.tag(1)
            
            NavigationStack {
                FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }.tag(2)
            
            NavigationStack {
                WatchedView()
            }
            .tabItem {
                Label("Watched", systemImage: "eye.fill")
            }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
