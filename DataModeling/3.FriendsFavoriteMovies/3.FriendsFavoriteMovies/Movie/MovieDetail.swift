//
//  MovieDetail.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/13/26.
//

import SwiftUI
import SwiftData

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    // 순서 고정하기 위해..
    var sortedFriends: [Friend] {
        movie.favoriteBy.sorted { first, second in
            first.name < second.name
            
        }
    }
    
    
    var body: some View {
        Form{
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate)
            
            if !movie.favoriteBy.isEmpty {
                Section("이 영화를 조아하는 친구들") {
                    ForEach(sortedFriends) { friend in
                        Text(friend.name)
                    }
                }
            }
            
        }
        .navigationTitle(isNew ? "새 영화" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소취소") {
                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}

#Preview("새 영화") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
