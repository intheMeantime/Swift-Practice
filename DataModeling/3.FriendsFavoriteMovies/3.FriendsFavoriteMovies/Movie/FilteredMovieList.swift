//
//  FilteredMovieList.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/14/26.
//

import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationSplitView {
            
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText) // 얘만 넣으면 검색창 생김ㄷㄷ
            
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
