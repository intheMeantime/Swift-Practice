//
//  Movie.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate: Date
    var favoriteBy = [Friend]() // 여러 친구들이 들어올 수 있도록
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    
    static let sampleData = [
        Movie(title: "Vanilla Sky",
              releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "The Curious Case of Benjamin Button",
              releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
    ]
}
