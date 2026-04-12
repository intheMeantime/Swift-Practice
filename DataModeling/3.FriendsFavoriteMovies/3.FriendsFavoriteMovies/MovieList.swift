//
//  MovieList.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/13/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    // movies 쿼리는 리스트를 채우는 데 사용하고, 환경에서 가져온 modelContext는 영화를 추가하고 삭제하는 데 사용
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) {movie in
//                    Text(movie.title)
                    NavigationLink(movie.title) {
                        Text("\(movie.title)에 대한 고찰")
                            .navigationTitle("Movie")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                
            }
            .navigationTitle(Text("Movies"))
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
