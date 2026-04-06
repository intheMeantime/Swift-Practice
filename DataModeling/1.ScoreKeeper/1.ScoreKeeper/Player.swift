//
//  Player.swift
//  1.ScoreKeeper
//
//  Created by nooy on 4/6/26.
//

import Foundation

// body 와 preview가 없는 파일임
// Content View에 나타나지는 않는 데이터들을 저장하기 위함

struct Player: Identifiable { // 여기서 Identifiable 같은 애들은 Protocol 이라고 부름. 이 프로토콜을 따르는 애들이라는 뜻.
    let id = UUID() // 동일한 데이터 값이 들어와도 구분할 수 있도록 ID
    
    var name: String // var: 변경될 수 있는 값
    var score: Int
    
}
