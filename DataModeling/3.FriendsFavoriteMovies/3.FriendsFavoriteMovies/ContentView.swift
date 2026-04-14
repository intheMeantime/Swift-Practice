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
            Tab("Friends", systemImage: "person.fill.turn.down") {
                FriendList()
            }


            Tab("Movies", systemImage: "popcorn") {
                // MovieList()
                FilteredMovieList()
                // 어차피 쿼리가 없으면 모두 뜨기 때문에 Filtered로 보여줌
            }
        }
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Friend.self, inMemory: true)
        .modelContainer(SampleData.shared.modelContainer)
}

