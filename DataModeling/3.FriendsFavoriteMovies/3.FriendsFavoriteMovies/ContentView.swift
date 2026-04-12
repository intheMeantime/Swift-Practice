//
//  ContentView.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/12/26.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Friends", systemImage: "person.and.person") {
                FriendList()
            }


            Tab("Movies", systemImage: "film.stack") {
                MovieList()
            }
        }
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Friend.self, inMemory: true)
        .modelContainer(SampleData.shared.modelContainer)
}

