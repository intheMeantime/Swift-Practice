//
//  Friend.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie? // 오 내가 만든 무비...
    
    init(name: String){
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "nooy"),
        Friend(name: "yoon"),
        Friend(name: "david"),
        Friend(name: "mean"),
        Friend(name: "time"),
        
    ]
}
