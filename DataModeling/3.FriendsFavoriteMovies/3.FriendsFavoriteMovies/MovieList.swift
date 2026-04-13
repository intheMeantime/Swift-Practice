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
    @State private var newMovie: Movie?
    
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) {movie in
//                    Text(movie.title)
                    NavigationLink(movie.title) {
                        //Text("\(movie.title)에 대한 고찰")
                        MovieDetail(movie: movie)
                        
                    }
                }
                // 각 행을 스와이프하여 삭제하는 기능
                .onDelete(perform: deleteMovie(indexes:))
                
            }
            .navigationTitle(Text("Movies"))
            .toolbar{
                ToolbarItem {
                    Button("무비 추가", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // Edit 버튼은 뷰를 편집 모드로 전환!!
                    // 리스트 안에 삭제 동작(.onDelete)을 추가했기 때문에, 편집 모드에서는 각 행에 삭제 컨트롤이 표시됨.
                    EditButton()
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    // 영화 추가 함수
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    // 영화 삭제 함수
    private func deleteMovie(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
    
    
}



#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
