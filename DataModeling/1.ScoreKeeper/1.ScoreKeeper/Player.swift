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

// 어떤 타입이 Equatable을 준수한다고 선언하면, Swift는 자동으로 해당 타입의 모든 프로퍼티를 비교하여 같으면 true를 반환하는 구현을 제공
// 만약 두 플레이어가 같은 인스턴스인지 확인하고 싶다면, id property(속성)를 직접 비교
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
