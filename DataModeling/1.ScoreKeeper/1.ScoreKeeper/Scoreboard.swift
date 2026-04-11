//
//  Scoreboard.swift
//  1.ScoreKeeper
//
//  Created by nooy on 4/9/26.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "nooy", score: 0),
        Player(name: "yoon", score: 0),
        Player(name: "david", score: 0)
    ]
    
    var state = GameState.setup
    var doesHighestScoreWin = true
    
    
    var winners: [Player] {
        guard state == .gameOver else { // 아직 게임오버가 아니면 빈배열을 리턴
            return []
        }
        
        var winningScore = 0
        
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }

        return players.filter {player in
            player.score == winningScore
        }
    }
    
    // struct 타입의 경우,
    // 해당 struct의 property(속성)를 변경할 수 있는 메서드(func)에는 mutating 키워드를 붙여야 함!!!
    mutating func resetScore(to newValue: Int) { // 외부에서 to: 라고 받아오고, 여기 함수에서는 newValue라고 부름
        for index in 0..<players.count { // 그냥 리스트 하나씩 받아오는 게 아니라 index로 받아오넴.....
            players[index].score = newValue
        }
    }
}
