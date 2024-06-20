//
//  ContentView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    @State private var homeNavigationStack = NavigationPath()
    @State private var favoritesNavigationStack = NavigationPath()
    @State private var watchedNavigationStack = NavigationPath()
    
    var body: some View {
        TabView(selection: $selection) {
            homeNavigationView
                .tabItem {
                    Label("The Swirl", systemImage: "popcorn.fill")
                }
                .tag(Tab.home)
                .navigationResetter(selection: $selection, tab: .home) {
                    homeNavigationStack = NavigationPath()
                }
            
            favoritesNavigationView
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
                .tag(Tab.favorites)
                .navigationResetter(selection: $selection, tab: .favorites) {
                    favoritesNavigationStack = NavigationPath()
                }
            
            watchedNavigationView
                .tabItem {
                    Label("Watched", systemImage: "eye.fill")
                }
                .tag(Tab.watched)
                .navigationResetter(selection: $selection, tab: .watched) {
                    watchedNavigationStack = NavigationPath()
                }
        }
    }
    
    private var homeNavigationView: some View {
        NavigationStack(path: $homeNavigationStack) {
            HomeView()
                .navigationTitle("PopcornSwirl")
        }
    }
    
    private var favoritesNavigationView: some View {
        NavigationStack(path: $favoritesNavigationStack) {
            FavoritesView()
                .navigationTitle("Favorites")
        }
    }
    
    private var watchedNavigationView: some View {
        NavigationStack(path: $watchedNavigationStack) {
            WatchedView()
                .navigationTitle("Watched")
        }
    }
}

enum Tab {
    case home
    case favorites
    case watched
}

struct NavigationResetter: ViewModifier {
    @Binding var selection: Tab
    let tab: Tab
    let resetAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if selection == tab {
                    resetAction()
                }
            }
    }
}

extension View {
    func navigationResetter(selection: Binding<Tab>, tab: Tab, resetAction: @escaping () -> Void) -> some View {
        self.modifier(NavigationResetter(selection: selection, tab: tab, resetAction: resetAction))
    }
}
