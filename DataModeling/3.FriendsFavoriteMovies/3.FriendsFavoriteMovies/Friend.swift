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
