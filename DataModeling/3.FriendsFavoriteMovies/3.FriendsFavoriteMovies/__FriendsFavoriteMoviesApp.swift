//
//  __FriendsFavoriteMoviesApp.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/12/26.
//

import SwiftUI
import SwiftData

@main
struct __FriendsFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
