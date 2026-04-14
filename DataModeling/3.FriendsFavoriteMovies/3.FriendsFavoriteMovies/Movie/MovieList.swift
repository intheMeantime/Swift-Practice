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
    @Query private var movies: [Movie]
    // 밑에서 직접 Query를 초기화했으므로 다음은 삭제
    // @Query(sort: \Movie.title) private var movies: [Movie]
    
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    
    
    
    // 이제 MovieList를 다른곳에서 부를 때, titleFilter를 파라미터로 받게됨.
    init(titleFilter: String = "") {
        // predicate는 SwiftData가 데이터를 필터링할 조건을 설명할 때 사용
        // predicate가 true를 반환하면 해당 항목을 표시하겠다는 의미
        let predicate = #Predicate<Movie> { movie in
            
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
            // 쿼리에 포함할 영화를 선택하는 조건문
            // --> “제목 필터가 비어 있거나, 영화 제목이 필터 텍스트를 포함하고 있다면 해당 영화를 포함한다.”
        
        }
        // predicate를 사용하여 _movies 프로퍼티를 초기화
        // 일반적으로는 이 프로퍼티를 직접 다루지 않지만, 커스텀 쿼리를 만들 때는 직접 접근해야 함
        // 이러한 프로퍼티들은 뷰를 SwiftUI를 구동하는 엔진과 연결해줌
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    
    
    
    
    
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                //        NavigationSplitView {
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
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
                }
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
//        } detail: {
//            Text("Select a movie")
//                .navigationTitle("Movie")
//                .navigationBarTitleDisplayMode(.inline)
//        }
        
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
    NavigationStack { // 네비게이션 프리뷰는 뜨게 만들어주기
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "sky")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
