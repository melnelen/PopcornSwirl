//
//  ContentView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @State private var navigationStack = NavigationPath()
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack(path: $navigationStack) {
                HomeView()
                    .navigationTitle("PopcornSwirl")
                    .onChange(of: selection) {
                        navigationStack.removeLast(navigationStack.count)
                    }
            }
            .tabItem {
                Label("The Swirl", systemImage: "popcorn.fill")
            }.tag(1)
            
            NavigationStack(path: $navigationStack) {
                FavoritesView()
                    .navigationTitle("Favorites")
                    .onChange(of: selection) {
                        navigationStack.removeLast(navigationStack.count)
                    }
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }.tag(2)
            
            NavigationStack(path: $navigationStack) {
                WatchedView()
                    .navigationTitle("Watched")
                    .onChange(of: selection) {
                        navigationStack.removeLast(navigationStack.count)
                    }
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
