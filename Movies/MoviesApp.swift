//
//  MoviesApp.swift
//  Movies
//
//  Created by Maxime Maheo on 17/09/2020.
//

import SwiftUI

@main
struct MoviesApp: App {
    
    // MARK: - Properties
    @StateObject private var movieStore = MovieStore()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            MovieListView()
                .environmentObject(movieStore)
        }
    }
}
